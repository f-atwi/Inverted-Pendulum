clc;
close all;
clear;

g= 9.81;        %gravity constant
Mp = 0.027;     %mass of pendulum assembly
lp = 0.153;     %center of mass of pendulum assembly
r=  0.0826;     %length from motor shaft to pendulum pivot
Jp= 0.000698;   % pendulum moment of inertia relative to pivot
Jeq= 0.000368;  %equivalent moment of inertia acting on the DC motor shaft
Bp= 1.4;          %Viscous damping about the pendulum pivot
Beq= 0.93;         %equivalent viscous damping acting on the DC motor shaft
Kt= 0.0333;     %DC motor current-torque constant
Km= 0.0333;     %DC motor back-emf constant
Rm= 8.7;        %Electric resistance of the DC motor armature

IC=[0 0.2 0 0];

A= [[0 , 0 , 1 , 0];
    [0 , 0 , 0 , 1];
    [0 , Mp^2*lp^2*r*g/(Jeq*Jp+Jeq*Mp*lp^2+Mp*r^2*Jp) , -(Jp*Kt*Km+Mp*lp^2*Kt*Km)/Rm/(Jeq*Jp+Jeq*Mp*lp^2+Mp*r^2*Jp) , -Beq];
    [0 , Mp*lp*g*(Jeq+Mp*r^2)/(Jeq*Jp+Jeq*Mp*lp^2+Mp*r^2*Jp) , -Mp*lp*r*(Kt*Km)/Rm/(Jeq*Jp+Jeq*Mp*lp^2+Mp*r^2*Jp) , -Bp] ];

B=  [0 ; 0 ; Kt*(Jp+Mp*lp^2)/Rm/(Jeq*Jp+Jeq*Mp*lp^2+Mp*r^2*Jp) ; Mp*lp*Kt*r/Rm/(Jeq*Jp+Jeq*Mp*lp^2+Mp*r^2*Jp)];

C= [[1 0 0 0];
    [0 1 0 0];
    [0 0 1 0];
    [0 0 0 1]];

D= [0 ; 0 ; 0 ; 0];

Q= [[3 0 0 0]
    [0 2 0 0]
    [0 0 5 0]
    [0 0 0 0]];
R=1;

[K,S,e]=lqr(A,B,Q,R);

% sim('Rot_Pen_LQR.slx',10);
% sim('Rot_Pen_PID.slx',10);
% sim('Copy_of_Rot_Pen_PID.slx',10);
sim('Rot_Pen_FLC.slx'   ,10);
