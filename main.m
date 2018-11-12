clear all;
close all;

N = 5;
theta = 2*pi*sort((rand(1, N)));
r = randi([0 5], 1, 1);
h = randi([-5 5], 1, 1);
k = randi([-5 5], 1, 1);

x = r*cos(theta) + h;
y = r*sin(theta) + k;

th = 0:pi/50:2*pi;
xunit = r*cos(th) + h;
yunit = r*sin(th) + k;

figure;
k = 0;
while true
    class = [de2bi(k) zeros(1, N - length(de2bi(k)))];
    subplot(ceil((2^N)/8), 8, k + 1);
    plot(xunit, yunit);
    hold on;
    pos = find(class == 1);
    neg = find(class == 0);
    plot(x(pos), y(pos), 'ko', 'MarkerFaceColor', 'g');
    plot(x(neg), y(neg), 'ko', 'MarkerFaceColor', 'r');
    title(['Plot ',num2str(k + 1)]);
    if k ~= 0
        xpos = [x(pos) x(pos(1))];
        ypos = [y(pos) y(pos(1))];
        plot(xpos, ypos, 'color', 'green');
    end
    if class == ones(1, N)
        break;
    end
    k = k + 1;
end
BNK = 0;
for i = 1:N+1
    BNK = BNK + nchoosek(N, i - 1);
end

fprintf("B(N,K) = %d\n",BNK);