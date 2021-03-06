clear all;
close all;
epsilon=0.001;
Nx = 40; % Space discretization
Nt = 200; % Time discretization : need to check the CFL condition
theta=0.33;
FinalTime = 5; 
TARGET=theta;
N=1;
pen=10^(-6);
pen2=1000;
       L=5;%sqrt(1/pi);
       %MU=0.5*1/(pi*30^2);
              MU=1;

       
xi = 0; xf = L; % Domain of the problem
% Discretization of the Space
xline = linspace(xi,xf,Nx);
dx = xline(2) - xline(1);

Y00 = 0*xline'; % Initial data of the given trajectory
Y01 = 0*xline'+1; % Initial data of the given trajectory
Y1 = theta*ones(size(xline))'; % Initial data of the target trajectory
%% Casadi run


       
       opti = casadi.Opti();  % CasADi function
%% ---- Input variables ---------
Y = opti.variable(Nx,Nt+1); % state trajectory
U = opti.variable(1,Nt+1);   % control
T=FinalTime;
%% ---- Control constraints -----------
opti.subject_to(-50<=U(:));           % control is limited
opti.subject_to(U(:)<=50);           % control is limited
opti.subject_to(Y(:,1)==Y00);
opti.set_initial(Y, 0);
opti.set_initial(U, 0);
       
       %% ---- Dynamic constraints --------
g=@(j,k) (Y(j,k)-theta)*(1-Y(j,k));
for k=1:Nt % loop over control intervals
   for j=2:Nx-1
       opti.subject_to(dx^2*(Y(j,k+1)-Y(j,k))==(T/Nt)*(MU*(-2*Y(j,k+1)+Y(j+1,k+1)+Y(j-1,k+1))+0.5*MU*dx*(N-1/(j*dx))*(Y(j+1,k+1)-Y(j-1,k+1))+dx^2*Y(j,k+1)*g(j,k)));
   end
       opti.subject_to(dx^2*(Y(1,k+1)-Y(1,k))==(T/Nt)*(MU*(-2*Y(1,k+1)+2*Y(2,k+1))+dx^2*Y(1,k+1)*g(1,k)));
       opti.subject_to(Y(Nx,k)==U(k));
end
opti.minimize(pen*((U(:)-theta)'*(U(:)-theta))+pen2*((Y(:,Nt+1)-TARGET*ones(Nx,1))')*((Y(:,Nt+1)-TARGET*ones(Nx,1)))+pen2*((Y(:,Nt)-TARGET*ones(Nx,1))')*((Y(:,Nt)-TARGET*ones(Nx,1))))
%pen2*(Y(1,Nt+1)-theta)^2 +pen2*(Y(1,Nt)-theta)^2
%% ---- solve NLP              ------
opti.solver('ipopt'); % set numerical backend
tic
sol = opti.solve();   % actual solve
toc


state1=opti.value(Y);
control1=opti.value(U);


%set(gca,'XTickLabelMode','auto')
%title('Bistable Nonlinearity','fontsize',24,'interpreter','latex');

F1=figure;

plot(control1)
        xticklabels({'0','5'});
        xticks([0 Nt+1]);
        xlabel('Time');
        ylabel('Boundary Conrol');
        line([0 2*Nt], [0 0],'Color','k');
                line([0 2*Nt], [1 1],'Color','k');
                xlim([0 Nt+2]);
                              yticks([0 1])
    yticklabels({'0','1'});
set(gca,'FontSize',22)
        a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',22)
               set(F1,'PaperSize',[6 5]);
        print(F1,'violation.pdf','-dpdf');
        
        
            %caxis([0 theta1])
            %surf(r.*cos(ang),r.*sin(ang),radialsol(r));
            %zlim([0 theta1]);
%             colormap('jet');
%             colorbar
%             shading interp;
            state=[flipud(state1); state1];
            
%             for i=Nt/2:Nt
%                 plot(state(:,i))
%                 ylim([-2 8])
%                 pause(0.1)
%             end
            
 
    
F3=figure;
reset(gca);
plot(state(:,floor(130)))
xticks([0 2*Nx]);
xticklabels({'-5','5'});
title(strcat('Controlled state at $t=$',num2str((T/Nt)*floor(130))),'interpreter','latex','fontsize',20)
line([0 2*Nx], [0 0],'Color','k');
yticks([0 theta 1])
yticklabels({'0','\theta','1'});
ylabel('$u(t)$','interpreter','latex','fontsize',20)
xlabel('$x$','interpreter','latex','fontsize',20)
line([0 2*Nx], [1 1],'Color','k');
        a = get(gca,'XTickLabel');  
set(gca,'XTickLabel',a,'fontsize',22)
ylim([-1 1.2])
               set(F3,'PaperSize',[6 5]);
print(F3,'violation2.pdf','-dpdf');

F4=figure;
surf(state)
view(2)
shading interp
colorbar
