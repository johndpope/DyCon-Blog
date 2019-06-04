# Minimal time for the constrained controllability of the fractional heat equation.

# 1: define the parameters

param Nx = 20;               # number of spatial discretization points
param Nt = 100;              # number of time discretization points
param y0 {1..Nx};            # initial condition
param y1 = 0;                # target
param dx = 2/Nx;             # Space step
param C = 1;                 # Bound on the controls
param A {1..Nx,1..Nx};       # Stiffness or rigidity matrix 
param B {1..Nx,1..Nx};       # Control matrix                
param M {1..Nx,1..Nx};       # Mass matrix  

# 2: define the variables

var y {j in 0..Nt, i in 1..Nx};       # State	
var u {j in 0..Nt, i in 1..Nx}>=-C;   # Control ---> The general system is y' = Ay + Bu	 
var T >=0;                            # Time horizon
var dt = T/Nt;                        # Time step


# 3: define the data
 
data;

# Initial datum
param y0: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 := 
1 -0.000000 -0.905270 -1.785847 -2.617711 -3.378170 -4.046482 -4.604416 -5.036753 -5.331701 -5.481215 -5.481215 -5.331701 -5.036753 -4.604416 -4.046482 -3.378170 -2.617711 -1.785847 -0.905270 -0.000000;

# Stiffness or rigidity matrix A
param A: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 :=
1 -5.551728 2.242487 0.359689 0.077115 0.033148 0.017829 0.010871 0.007193 0.005044 0.003694 0.002798 0.002178 0.001733 0.001405 0.001158 0.000966 0.000816 0.000697 0.000600 0.000521 
2 2.242487 -5.551728 2.242487 0.359689 0.077115 0.033148 0.017829 0.010871 0.007193 0.005044 0.003694 0.002798 0.002178 0.001733 0.001405 0.001158 0.000966 0.000816 0.000697 0.000600 
3 0.359689 2.242487 -5.551728 2.242487 0.359689 0.077115 0.033148 0.017829 0.010871 0.007193 0.005044 0.003694 0.002798 0.002178 0.001733 0.001405 0.001158 0.000966 0.000816 0.000697 
4 0.077115 0.359689 2.242487 -5.551728 2.242487 0.359689 0.077115 0.033148 0.017829 0.010871 0.007193 0.005044 0.003694 0.002798 0.002178 0.001733 0.001405 0.001158 0.000966 0.000816 
5 0.033148 0.077115 0.359689 2.242487 -5.551728 2.242487 0.359689 0.077115 0.033148 0.017829 0.010871 0.007193 0.005044 0.003694 0.002798 0.002178 0.001733 0.001405 0.001158 0.000966 
6 0.017829 0.033148 0.077115 0.359689 2.242487 -5.551728 2.242487 0.359689 0.077115 0.033148 0.017829 0.010871 0.007193 0.005044 0.003694 0.002798 0.002178 0.001733 0.001405 0.001158 
7 0.010871 0.017829 0.033148 0.077115 0.359689 2.242487 -5.551728 2.242487 0.359689 0.077115 0.033148 0.017829 0.010871 0.007193 0.005044 0.003694 0.002798 0.002178 0.001733 0.001405 
8 0.007193 0.010871 0.017829 0.033148 0.077115 0.359689 2.242487 -5.551728 2.242487 0.359689 0.077115 0.033148 0.017829 0.010871 0.007193 0.005044 0.003694 0.002798 0.002178 0.001733 
9 0.005044 0.007193 0.010871 0.017829 0.033148 0.077115 0.359689 2.242487 -5.551728 2.242487 0.359689 0.077115 0.033148 0.017829 0.010871 0.007193 0.005044 0.003694 0.002798 0.002178 
10 0.003694 0.005044 0.007193 0.010871 0.017829 0.033148 0.077115 0.359689 2.242487 -5.551728 2.242487 0.359689 0.077115 0.033148 0.017829 0.010871 0.007193 0.005044 0.003694 0.002798 
11 0.002798 0.003694 0.005044 0.007193 0.010871 0.017829 0.033148 0.077115 0.359689 2.242487 -5.551728 2.242487 0.359689 0.077115 0.033148 0.017829 0.010871 0.007193 0.005044 0.003694 
12 0.002178 0.002798 0.003694 0.005044 0.007193 0.010871 0.017829 0.033148 0.077115 0.359689 2.242487 -5.551728 2.242487 0.359689 0.077115 0.033148 0.017829 0.010871 0.007193 0.005044 
13 0.001733 0.002178 0.002798 0.003694 0.005044 0.007193 0.010871 0.017829 0.033148 0.077115 0.359689 2.242487 -5.551728 2.242487 0.359689 0.077115 0.033148 0.017829 0.010871 0.007193 
14 0.001405 0.001733 0.002178 0.002798 0.003694 0.005044 0.007193 0.010871 0.017829 0.033148 0.077115 0.359689 2.242487 -5.551728 2.242487 0.359689 0.077115 0.033148 0.017829 0.010871 
15 0.001158 0.001405 0.001733 0.002178 0.002798 0.003694 0.005044 0.007193 0.010871 0.017829 0.033148 0.077115 0.359689 2.242487 -5.551728 2.242487 0.359689 0.077115 0.033148 0.017829 
16 0.000966 0.001158 0.001405 0.001733 0.002178 0.002798 0.003694 0.005044 0.007193 0.010871 0.017829 0.033148 0.077115 0.359689 2.242487 -5.551728 2.242487 0.359689 0.077115 0.033148 
17 0.000816 0.000966 0.001158 0.001405 0.001733 0.002178 0.002798 0.003694 0.005044 0.007193 0.010871 0.017829 0.033148 0.077115 0.359689 2.242487 -5.551728 2.242487 0.359689 0.077115 
18 0.000697 0.000816 0.000966 0.001158 0.001405 0.001733 0.002178 0.002798 0.003694 0.005044 0.007193 0.010871 0.017829 0.033148 0.077115 0.359689 2.242487 -5.551728 2.242487 0.359689 
19 0.000600 0.000697 0.000816 0.000966 0.001158 0.001405 0.001733 0.002178 0.002798 0.003694 0.005044 0.007193 0.010871 0.017829 0.033148 0.077115 0.359689 2.242487 -5.551728 2.242487 
20 0.000521 0.000600 0.000697 0.000816 0.000966 0.001158 0.001405 0.001733 0.002178 0.002798 0.003694 0.005044 0.007193 0.010871 0.017829 0.033148 0.077115 0.359689 2.242487 -5.551728;

# Control matrix B
param B: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 :=
1 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
2 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
3 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
4 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
5 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
6 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
7 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
8 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
9 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
10 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
11 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
12 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
13 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
14 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
15 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
16 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 
17 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 
18 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 
19 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
20 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000; 

# Mass matrix M
param M: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 :=
1 0.070175 0.017544 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
2 0.017544 0.070175 0.017544 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
3 0.000000 0.017544 0.070175 0.017544 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
4 0.000000 0.000000 0.017544 0.070175 0.017544 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
5 0.000000 0.000000 0.000000 0.017544 0.070175 0.017544 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
6 0.000000 0.000000 0.000000 0.000000 0.017544 0.070175 0.017544 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
7 0.000000 0.000000 0.000000 0.000000 0.000000 0.017544 0.070175 0.017544 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
8 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.017544 0.070175 0.017544 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
9 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.017544 0.070175 0.017544 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
10 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.017544 0.070175 0.017544 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
11 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.017544 0.070175 0.017544 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
12 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.017544 0.070175 0.017544 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
13 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.017544 0.070175 0.017544 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 
14 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.017544 0.070175 0.017544 0.000000 0.000000 0.000000 0.000000 0.000000 
15 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.017544 0.070175 0.017544 0.000000 0.000000 0.000000 0.000000 
16 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.017544 0.070175 0.017544 0.000000 0.000000 0.000000 
17 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.017544 0.070175 0.017544 0.000000 0.000000 
18 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.017544 0.070175 0.017544 0.000000 
19 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.017544 0.070175 0.017544 
20 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000 0.017544 0.070175;

# 4: define the cost functional to minimize

minimize cost: T;

# 5: define the constraints

# 5.a: dynamics y' = Ay + Bu, implemented through an Explicit Euler method.
subject to y_dyn {j in 1..Nt, i in 2..Nx-1}:
sum {l in 1..Nx} M[i,l]*y[j,l] = sum {l in 1..Nx}M[i,l]*y[j-1,l] + dt*sum {l in 1..Nx}(A[i,l]*y[j-1,l] + B[i,l]*u[j-1,l]); 

# 5.b: homogeneous Dirichlet boundary conditions in -1 and 1.
subject to left_boundary  {j in 0..Nt}: y[j,1] = 0;
subject to right_boundary {j in 0..Nt}: y[j,Nx] = 0;

# 5.c: initial condition.
subject to y_init {i in 1..Nx}: y[0,i] = y0[i];

# 5.d: target.
subject to y_end1 {i in 1..Nx}: y[Nt,i] = y1;

# 6: solve the problem with IpOpt

option solver ipopt;
option ipopt_options "max_iter=100000 linear_solver=mumps hessian_approximation=exact halt_on_ampl_error yes";
solve;

# 7: print the results.

printf: "T  = %24.16e\n", T;
printf: "Nx = %d\n", Nx;    
printf: "Nt = %d\n", Nt;    
printf {j in 0..Nt, i in 1..Nx}: " %24.16e\n", y[j,i]; 
printf {j in 0..Nt, i in 1..Nx}: " %24.16e\n", u[j,i]; 

end;
