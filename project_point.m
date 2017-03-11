function [ p_img ] = project_point( p,f )
% Given: Point p in 3-space [x y z], and focal length f
% Return: Location of projected point on 2D image plane [u v]
A = [f,0,0,0;
     0,f,0,0;
     0,0,1,0];
p_hom = [p 1]';
p_proj = A*p_hom;
p_img=[p_proj(1)/p_proj(3) p_proj(2)/p_proj(3)];
end

