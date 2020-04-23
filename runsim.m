disp('*This Program calculates Optimal distance required')
disp('to minimize the Bending Moment in Cantilever Beam with UDL load*')
global W L
W = input('Enter UDL(Uniformly Distributed Load) Value (Nm): ');
L = input('Enter Length of Cantilever Beam (m): ');
x0=L/2;
LB=[];
UB=[];
[XOPT,FOPT,EXITFLAG,OUTPUT,LAMBDA,GRAD]=fmincon(@Objective,x0,[],[],[],[],LB,UB,@Constraint);
global W L
Ymax=L; Ymin=0;
Ys=(Ymax-Ymin)/100;
for i=1:101
Xs(i)=Ymin+Ys*(i-1);
BMs(i)=(W/4)*((2*L*Xs(i))-(L^2)-((Xs(i)^2)/2));
BMo(i)=W*((L-Xs(i))^2)/8;
end
plot(Xs,BMo)
hold on
plot(Xs,BMs)
axis([0 L 0 max(BMs)])
hold on
plot(XOPT,FOPT,'*')
grid on
grid minor
legend('BM over hanginig','BM between support','Minimal of BMmax','Location','north')
xlabel('Distance Between support')
ylabel('Value of Bending Moment')
title('Beam Support Location')