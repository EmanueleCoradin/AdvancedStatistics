
data {
  int <lower=0> N; 
  int y[N]; 
} 

parameters { 
  real <lower=0,upper =1> lambda; 
} 

model { 
  lambda ~ uniform(0,Inf); 
  y ~ poisson (lambda); 
}
