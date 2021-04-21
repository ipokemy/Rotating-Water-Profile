% JEREMY CHOY (145923)

clc, close all, clear all

% Given
g=9.812;
D=4;
h=2.5;
R=D/2;
h0=4/5*h;
x=0:0.1:4;
xc=2;
r=abs(x-xc);

fprintf('The value of w must be within the range <strong>0<=w<=2.21</strong>\n')

% Looping for input
ready=false;
while ~ready
    w=input('w = ');
    ready=(w>=0 && w<=2.21);
    if ready == false
        disp('<strong>ERROR: INVALID INPUT</strong>')
    end
end

% Rotating Water Profile
Zs=@(r) h0-(w^2/(4*g))*(R^2-2*r.^2);
p1=plot(x,Zs(r));
ylim([0 3])

hold on

% Container
line([0 0],[0 2.5],'Color','Black','LineWidth',5);
line([4 4],[0 2.5],'Color','Black','LineWidth',5);
line([0 4],[0 0],'Color','Black','LineWidth',5);
xline(2,'m--','Symmetry Line');
yline(2,'k--','Still Water Profile');

% Minimum Point
xmin=0;
r=abs(xmin-2);
p2=plot(r,Zs(xmin),'r.','MarkerSize',20);

% Label
xlabel('x')
ylabel('f(x)')
legend([p1 p2],{'Rotating Water Profile, Zs','Minimum Point'})
