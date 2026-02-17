module NBalls

import SpecialFunctions:gamma
import DataFrames:DataFrame
export n_ball_surface
export n_ball_volume
export n_ball_vol_surf

@inline function n_ball_volume(r::Float64,n::Int64)
  y=(pi^(n/2))*r^n/gamma((n/2)+1)
 return y
 end

@inline function n_ball_surface(r::Float64,n::Int64)
y=(2*pi^(n/2))*r^(n-1)/gamma(n/2)
return y
end

@inline function n_ball_vol_surf(r::Float64,n::Int64)
  s="$(n_ball_volume(r,n))"
  s1="$n-Ball Volume: "
  s2="$(n_ball_surface(r,n))"
  s3="$n-Ball Surface: "
  println(s1*s)
  println(s3*s2)
end

@inline function n_ball_volume(r::Vector{Float64},n::Int64)
 (pi^(n/2).*r.^(n))./gamma(n/(2)+1)
end

@inline function n_ball_surface(r::Vector{Float64},n::Int64)
  (2*pi^(n/2).*r.^(n-1))./gamma(n/(2))
end

@inline function n_ball_vol_surf(r::Vector{Float64},n::Int64)
  x=n_ball_surface(r,n)
  y=n_ball_volume(r,n)
  s="$n-Ball Volume"
  s1="$n-Ball Surface"
  return(DataFrame(s1=>x,s=>y))
end


end