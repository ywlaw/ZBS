% Generates figure ZBS-prob2

r = [0.06, 0.07, 0.08, 0.09, 0.10, 0.11, 0.12, 0.13, 0.14, 0.15, 0.16, 0.17, 0.18, 0.19, 0.20];

p = 0; for i = 1:size(r, 2), p(i) = pi*r(i)*r(i); end

phi = [		% k=1:25 analytical; k=26:40 experimental
0.862168,
0.75613 ,
0.673142,
0.607086,
0.553643,
0.509726,
0.473108,
0.44216 ,
0.41568 ,
0.392767,
0.372737,
0.355069,
0.339355,
0.325277,
0.31258 ,
0.301063,
0.290558,
0.280932,
0.272072,
0.263885,
0.256292,
0.249233,
0.242636,
0.236162,
0.23446 ,	% 25
0.227221,	% 26
0.224088,	% 27
0.222181,	% 28
0.217223,	% 29
0.211092,	% 30
0.209782,	% 31
0.206642,	% 32
0.205618,	% 33
0.201113,	% 34
0.196154,	% 35
0.190096,	% 36
0.187899,	% 37
0.182061,	% 38
0.180351,	% 39
0.178115];	% 40

sigma = [	% k=1:50
1.148359264, 
1.24224756 ,
1.324327376,
1.398556399,
1.42577628 ,
1.478504988,
1.505300634,
1.530001634,
1.558994868,
1.589912891,
1.60128386 ,
1.616833943,
1.628118546,
1.644446715,
1.676978831,
1.68463824 ,
1.680960142,
1.692743631,
1.706021981,
1.714721552,
1.717018928,
1.728896469,
1.72663314 ,
1.738282773,
1.748649193,
1.75472391 ,
1.759416949,
1.760128688,
1.769109098,
1.770747582,
1.777577846,
1.779811226,
1.781213631,
1.788004754,
1.792861958,
1.793909139,
1.795260705,
1.798126247,
1.801043864,
1.805415465,
1.801571259,
1.811608401,
1.811076752,
1.819349059,
1.819215215,
1.820560353,
1.816816722,
1.825232314,
1.823967379,
1.82863501];

n = 300;

P_V = 0;
P_H = 0;
P_U = 0;
for i = 1:size(r, 2)
	P_V(i) = (1+3*sqrt(3)/(4*pi))*p(i);	
	k = ceil(p(i)*n);
	sigmasq = sigma(i)*sigma(i);
	P_U(i) = 8*(1-sigmasq)*acos(sigma(i)/2) + sigma(i)*(2+sigmasq)*sqrt(4-sigmasq);
	P_U(i) = P_U(i)*p(i)/(4*pi*(4-sigmasq));
	P_H(i) = (phi(k)*P_U(i) - sqrt(3)*p(i)/4/pi)/(phi(k)-1);
end

clf;
hold all;
semilogy(p, P_V, '-x');
semilogy(p, P_H, '-+');
semilogy(p, P_U, '-<');
xlim([0.01, 0.085]);
xlabel('Link probability (p)');
ylabel('Risk probabilities');
legend('P_V(u,v)', 'P_H(u,v,)', 'P_U(u,v)');