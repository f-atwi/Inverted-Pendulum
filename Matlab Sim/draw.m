close all;
axis([-0.1 0.1 -0.1 0.1 0 0.4]);


for t= 1:1000
    alpha=Alpha(t);
    thetta=Thetta(t);
    rod=line([0 , r*cos(thetta)],[0 , r*sin(thetta)], [0 , 0] , 'linewidth',1);
    stand=line([r*cos(thetta) , r*cos(thetta)] , [r*sin(thetta),r*sin(thetta)],[0 , 0.13]);
    pivot=line([r*cos(thetta), (r+0.01)*cos(thetta)], [r*sin(thetta), (r+0.01)*sin(thetta)] , [0.13 0.13]);
    pendulum=line([(r+0.01)*cos(thetta), (r+0.01)*cos(thetta)+lp*sin(alpha)*sin(thetta)],[(r+0.01)*sin(thetta),(r+0.01)*sin(thetta)+lp*sin(alpha)*cos(thetta)], [0.13 , 0.13+lp*cos(alpha)],'linewidth',3);
    
    
    pause(0.007);
    delete(rod);
    delete(stand);
    delete(pivot);
    delete(pendulum);
end
