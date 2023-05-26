clear all
close all
load dados

mv=VideoReader('slow motion back flip.wmv'); %ler o video para mv
mov=readFrame(mv); %ler o primeiro frame
figure(1)
image(mov)%mostrar o primeiro frame
% medimos a altura do rapaz em pixeis

%[x1, y1]=ginput(2);%pedem,se dois pontos, pes e cabeça
%hpixeis=abs(y1(1)-y1(2));%a distancia em pixels entre pes e cabeça
pix_metro=1.75/hpixeis; % assumindo uma altura de 1.75m, temos a conversao

nframes = int32(mv.Duration*mv.FrameRate); %numero de frames no video
ti = 28; tf = 35; % fixar os instantes iniciais e finais de interesse
framei = ti*mv.FrameRate; framef=tf*mv.FrameRate; %frames iniciais e finais
mv.CurrentTime = ti; % salta para tempo ti
n = 10; % ler frames de n em n
dtframes = n/mv.FrameRate; % tempo entre frames a ler
nf = (framef-framei)/n; % numero de frames a ler
xcm=zeros(1,nf);ycm=zeros(1,nf);
for i=1:nf
    mov=readFrame(mv);     image(mov); %le imagem/representa imagem
    mv.CurrentTime=mv.CurrentTime+dtframes; % posiciona no frame a ler
    %ler pontos do centro de massa do rapaz em cada frame
    title(strcat('Frame',num2str(i),' Ponto ',num2str(i)));
    %[xcm(i), ycm(i)]=ginput(1);%pede se o centro de massa
end
%pause(5)
%save dados

figure(1)
t=1:nf;
h=(360-ycm)*pix_metro; % altura do CM em metros
a=polyfit(t,h,2);%o polinomio de ajuste a(1)^3 a(2)^2...
yr=a(3)+a(2)*t+a(1)*t.^2;%a funçao ajustada
%yr2=polyval(a,t);%a linha anterior e esta sao equivalentes
plot(t,h,'rx',t,yr,'k-')% os pontos obtidos em funcao do melhor ajuste
xlabel('frame') ;ylabel ('altura (m)')
%intervalo de tempo entre frames para obter g=9.8 m/s^2
dtreal=sqrt( -2*a(1) / 9.8);% -dt^2 / *g =a(1)
% este e o dtreal entre frames no video original espaçados de n frames
% No video original cada frame esta espaçado de dtreal/n
dtreal=dtreal/n;
% o filme foi filmado a 
RateReal=1/dtreal; % mas está a ser reproduzido a 30 frames/s
fprintf(1,' A Rate Frame de Filmagem foi %f e a FrameRate de reprodução do video é %f\n',RateReal, mv.FrameRate);
pause(5)
hf=figure(2);
mv.CurrentTime=ti; % salta para tempo ti
for i=1:nf
    mov=readFrame(mv);     image(mov); %representa imagem
    hold on
    title(strcat('Frame ',num2str(1+(i-1)*n),' Ponto ',num2str(i)));
    plot(xcm(i),ycm(i),'ro','MarkerSize',10,'MarkerFaceColor',[1,0,0])      
    hold off
    drawnow
    mv.CurrentTime=mv.CurrentTime+dtframes; % posiciona no frame a ler
    F(i)=getframe(hf);%guardam-se os frames
    pause(0.3)
end
pause(5)

% reproducao em tempo real
hf=figure(3);
framerate=RateReal/n;%o framerate
movie(hf,F,1,framerate); % para reproduzir em tempo real
pause(5)

figure(4) % aquisição de pontos  para a velocidade angular
mv.CurrentTime=ti; % salta para tempo ti
n=10; % ler frames de n em n
dtframes=n/mv.FrameRate; % tempo entre frames a ler
nf=(framef-framei)/n; % numero de frames a ler
for i=1:nf
    mov=readFrame(mv);     image(mov); %representa imagem
    mv.CurrentTime=mv.CurrentTime+dtframes; % posiciona no frame a ler
    %ler pontos do centro de massa do rapaz em cada frame
    title(strcat('Frame',num2str(i),' Ponto  ',num2str(i)));
%     for ip=1:4
%         [x2(i,ip) ,y2(i,ip)]=ginput(1); %ler 4 pontos pes, joelhos, bacia, cabeca
%     end
end
%save dados 
pause(5)

hf=figure(5);%homem com os pontos marcados a mais
mv.CurrentTime=ti; % salta para tempo ti
for i=1:nf
    mov=readFrame(mv);     image(mov); %representa imagem
    hold on
    title(strcat('Frame ',num2str(1+(i-1)*n),' Ponto  ',num2str(i)));
    plot(x2(i,:),y2(i,:),'r-','LineWidth',2,'Color',[1,0,0])  % desenhar tudo
    %plot(x2(i,3:4),y2(i,3:4),'r-','LineWidth',2,'Color',[1,0,0]) %bacia-cabeça
    hold off
    drawnow
    mv.CurrentTime=mv.CurrentTime+dtframes; % posiciona no frame a ler
    pause
end

pause(5)
 
figure (6)
%3 bacia -/- 4 cabeça
teta=atan2(360-y2(:,4)-(360-y2(:,3)),x2(:,4)-x2(:,3));%menos 360 por ser a resolucao do vid 
teta(teta<0)=teta(teta<0)+2*pi;
teta(end)=teta(end)+2*pi;
ang=teta*180/pi;
t=(1:nf)*dtreal;
xpol=linspace(t(1),t(end),200);
ypol=interp1(t,teta,xpol,'spline','extrap');
plot(t, teta,'o',xpol,ypol,'r-')

xlabel('t'); ylabel('teta')
pause(5)

figure(7)
w=diff(ypol)./diff(xpol);
plot(xpol(2:end),w,'k-',t,360-ycm,'x')
ylabel('w'); xlabel('t')
text(0.01,190,'Pernas e maos junto ao tronco perto da altura máxima')
save dados
