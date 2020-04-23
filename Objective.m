function [f]=Objective(xs)
global W L
%W=100; L=60;
BMs=(W/4)*((2*L*xs)-(L^2)-((xs^2)/2));
BMo=W*(((L-xs))^2)/8;
BM=[BMs BMo];
f=max(BM);