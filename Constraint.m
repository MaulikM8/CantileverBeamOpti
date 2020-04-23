function [g,h]=Constraint(xs)
global L
%L=60;
g1=0.1-xs;
g2=xs-L;
g=[g1;g2];
h=[];