close all;
clear all;
clc

formatSpec = '%f';

fileID_3 = fopen('experiment_no_attack/tank_1.txt','r');
tank_1= fscanf(fileID_3,formatSpec);

fileID_2 = fopen('experiment_no_attack/tank_2.txt','r');
tank_2= fscanf(fileID_2,formatSpec);

fileID_1 = fopen('experiment_no_attack/ph.txt','r');
ph = fscanf(fileID_1,formatSpec);

fileID_4 = fopen('received.txt','r');
received = fscanf(fileID_4,formatSpec);

fileID_5 = fopen('estimated.txt','r');
estimated = fscanf(fileID_5,formatSpec);

fileID_6 = fopen('attack_no_defense_sensor/attack_tank_1.txt','r');
attack_tank_1 = fscanf(fileID_6,formatSpec);

 for i=1:length(attack_tank_1)
     if (attack_tank_1(i)) > 1.0
         attack_tank_1(i) = 1.0;
     end
 end

fileID_7 = fopen('attack_no_defense_sensor/attack_tank_2.txt','r');
attack_tank_2= fscanf(fileID_7,formatSpec);

fileID_8 = fopen('defense_experiment_compromised_sensor/defense_tank_1.txt','r');
defense_tank_1 = fscanf(fileID_8,formatSpec);

fileID_9 = fopen('defense_experiment_compromised_sensor/defense_tank_2.txt','r');
defense_tank_2= fscanf(fileID_9,formatSpec);

fileID_10 = fopen('random_no_def_tank_1.txt','r');
random_no_def_tank_1= fscanf(fileID_10,formatSpec);

fileID_11 = fopen('random_def_tank_1.txt','r');
random_def_tank_1= fscanf(fileID_11,formatSpec);

fileID_12 = fopen('gaussian_noise_experiments/tank_1_no_def_0_5.txt','r');
noise_no_def_0_5= fscanf(fileID_12,formatSpec);

fileID_13 = fopen('gaussian_noise_experiments/tank_1_def_0_5.txt','r');
noise_def_0_5= fscanf(fileID_13,formatSpec);

fileID_14 = fopen('gaussian_noise_experiments/tank_1_no_def_1_0.txt','r');
noise_no_def_1_0= fscanf(fileID_14,formatSpec);

fileID_15 = fopen('gaussian_noise_experiments/tank_1_def_1_0.txt','r');
noise_def_1_0= fscanf(fileID_15,formatSpec);

fileID_16 = fopen('gaussian_noise_experiments/tank_1_no_def_0_9.txt','r');
noise_no_def_0_9= fscanf(fileID_16,formatSpec);

fileID_17 = fopen('gaussian_noise_experiments/tank_1_def_0_9.txt','r');
noise_def_0_9= fscanf(fileID_17,formatSpec);

fileID_18 = fopen('gaussian_noise_experiments/tank_1_no_def_0_8.txt','r');
noise_no_def_0_8= fscanf(fileID_18,formatSpec);

fileID_19 = fopen('gaussian_noise_experiments/tank_1_def_0_8.txt','r');
noise_def_0_8= fscanf(fileID_19,formatSpec);

fileID_20 = fopen('gaussian_noise_experiments/tank_1_no_def_0_7.txt','r');
noise_no_def_0_7= fscanf(fileID_20,formatSpec);

fileID_21 = fopen('gaussian_noise_experiments/tank_1_def_0_7.txt','r');
noise_def_0_7= fscanf(fileID_21,formatSpec);

fileID_22 = fopen('gaussian_noise_experiments/tank_1_no_def_0_6.txt','r');
noise_no_def_0_6= fscanf(fileID_22,formatSpec);

fileID_23 = fopen('gaussian_noise_experiments/tank_1_def_0_6.txt','r');
noise_def_0_6= fscanf(fileID_23,formatSpec);

fileID_24 = fopen('gaussian_noise_experiments/tank_1_no_def_0_4.txt','r');
noise_no_def_0_4= fscanf(fileID_24,formatSpec);

fileID_25 = fopen('gaussian_noise_experiments/tank_1_def_0_4.txt','r');
noise_def_0_4= fscanf(fileID_25,formatSpec);

fileID_26 = fopen('gaussian_noise_experiments/tank_1_no_def_0_3.txt','r');
noise_no_def_0_3= fscanf(fileID_26,formatSpec);

fileID_27 = fopen('gaussian_noise_experiments/tank_1_def_0_3.txt','r');
noise_def_0_3= fscanf(fileID_27,formatSpec);



plant_time = ([1:4001]*0.2/360)*60; % Rescaling 10
%defense_time= ([1:8001]*0.39995001249687578105473631592102/360)*15; % Rescaling 5

%ids_time = (([1:2264]*0.113171707/360)*60)*3;

fsz = 6;

%%%%%%%%%%%%%%%%%%%%%%%%% NORMAL OPERATION %%%%%%%%%%%%%%%%%%%%%%%%

% h1=figure(1);
% set(gca, 'FontSize', fsz, 'LineWidth', 2.0 ); 
% 
% subplot(2,1,1)
% plot(plant_time,tank_1)
% axis([0 120 0 1.25])
% grid on;
% 
% xlabel('Time (min)')
% ylabel('Tank 1 Level')
% 
% 
% subplot(2,1,2)
% plot(plant_time,tank_2)
% axis([0 120 0 1.25])
% grid on;
% 
% xlabel('Time (min)');
% ylabel('Tank 2 Level');
% 
% suptitle('Water Tank Level');
% 
% matlab2tikz('tank_levels.tikz', 'showInfo', false, 'parseStrings', false, 'standalone', false, 'height', '\figureheight', 'width', '\figurewidth');


%%%%%%%%%%%%%%%%%%%%%%%%% ATTACK NO DEFENSE %%%%%%%%%%%%%%%%%%%%%%%%

% h3=figure(3)
% set(gca, 'FontSize', fsz, 'LineWidth', 2.0 ); 
% 
% subplot(2,1,1)
% plot(plant_time,attack_tank_1)
% axis([0 120 0 1.25])
% grid on;
% 
% xlabel('Time (min)')
% ylabel('Tank 2 Level')
% 
% 
% subplot(2,1,2)
% plot(plant_time,attack_tank_2)
% axis([0 120 0 1.25])
% grid on;
% 
% xlabel('Time (min)')
% ylabel('Level')
% 
% suptitle('Water Tank 2 Level');
% 
% matlab2tikz('attack_no_defense.tikz', 'showInfo', false, 'parseStrings', false, 'standalone', false, 'height', '\figureheight', 'width', '\figurewidth');


%%%%%%%%%%%%%%%%%%%%%%%%% IDS DEFENSE %%%%%%%%%%%%%%%%%%%%%%%%

h4=figure(4)
set(gca, 'FontSize', fsz, 'LineWidth', 1.5 ); 
%set(h(4),'linewidth',2.0);

%subplot(2,1,1)
%plot(plant_time,tank_1, '-.k', 'linewidth', 1.5);
plot(plant_time,tank_1, '-.k', 'linewidth', 1.5);

hold on;
plot(plant_time,attack_tank_1, '--r', 'linewidth', 1.5);
%plot(plant_time,defense_tank_1, '-b', 'linewidth', 1.5)
plot(plant_time,defense_tank_1, '-b', 'linewidth', 1.5)
lg = legend('Normal Operation','Attack and No Defense ', 'With SDN Defense', 'FontSize', 8, 'Location','southwest');

axis([0 120 0 1.2])
grid on;

plot([42 42],[0 1.2], '--k')
axis([0 120 0 1.2])

%annotation('textarrow',[0.55,0.45],[0.37,0.37],'String','Attack');

xlabel('Time (min)')
ylabel('Tank 1 Level (m)')
title('Water Tank 1 Level Behavior With Attack and IDS');

matlab2tikz('defense_1.tikz', 'showInfo', false, 'parseStrings', false, 'standalone', false, 'height', '\figureheight', 'width', '\figurewidth');

% h5=figure(5)
% 
% 
% %subplot(2,1,2)
% plot(plant_time,defense_tank_2)
% axis([0 120 0 1.25])
% grid on;
% 
% xlabel('Time (min)')
% ylabel('Tank 2 Level (m)')
% 
% title('Water Tank 2 Level Behavior With Attack and IDS');
% 
% 
% 
% matlab2tikz('defense_2.tikz', 'showInfo', false, 'parseStrings', false, 'standalone', false, 'height', '\figureheight', 'width', '\figurewidth');



%%%%%%%%%%%%%%%%%%%%%%%%% IDS DATA %%%%%%%%%%%%%%%%%%%%%%%%

%  h5=figure(5)
%  set(gca, 'FontSize', fsz, 'LineWidth', 2.0 ); 
%  
% plot(estimated, 'k')
% grid on;
% plot(received, 'r')
% axis([0 120 0 1.25])
% xlabel('Time (min)')
% ylabel('Tank 1 Level')
% 
% xlabel('Time (min)')
% ylabel('Tank 2 Level')
% 
% suptitle('Water Tanks Level Behavior With Attack and IDS');
% 
% matlab2tikz('ids_data.tikz', 'showInfo', false, 'parseStrings', false, 'standalone', false, 'height', '\figureheight', 'width', '\figurewidth');


%%%%%%%%%%%%%%%%%%%%%%%%% RANDOM CONTROL %%%%%%%%%%%%%%%%%%%%%%%%

% h5=figure(5)
% set(gca, 'FontSize', fsz, 'LineWidth', 1.5 ); 
% %set(h(4),'linewidth',2.0);
% 
% %subplot(2,1,1)
% %plot(plant_time,tank_1, '-.k', 'linewidth', 1.5);
% plot(plant_time,random_no_def_tank_1, '-.k', 'linewidth', 1.5);
% 
% hold on;
% plot(plant_time,random_def_tank_1, '--b', 'linewidth', 1.5);
% 
% lg = legend('Normal Operation', 'With SDN Defense', 'FontSize', 8, 'Location','southwest');
% 
% axis([0 120 0 1.2])
% grid on;
% 
% %plot([42 42],[0 1.2], '--k')
% %axis([0 120 0 1.2])
% 
% %annotation('textarrow',[0.55,0.45],[0.37,0.37],'String','Attack');
% 
% xlabel('Time (min)')
% ylabel('Tank 1 Level (m)')
% title('Water Tank 1 Level Behavior With Random Control Actions');
% 
% matlab2tikz('random.tikz', 'showInfo', false, 'parseStrings', false, 'standalone', false, 'height', '\figureheight', 'width', '\figurewidth');
% 
% h6=figure(6)
% set(gca, 'FontSize', fsz, 'LineWidth', 1.5 ); 
% delta_random = abs(random_no_def_tank_1 - random_def_tank_1);
% plot(plant_time,delta_random, '-b', 'linewidth', 1.5)
% 
% axis([0 120 0 0.5])
% grid on;
% 
% xlabel('Time (min)')
% ylabel('Tank 1 Level (m)')
% title('Difference between Water Tank Level with and without the Defense');
% 
% matlab2tikz('random_delta.tikz', 'showInfo', false, 'parseStrings', false, 'standalone', false, 'height', '\figureheight', 'width', '\figurewidth');
% 

%%%%%%%%%%%%%%%%%%%%%%%%% GAUSIAN NOISE ON THE LIT101 0.5%%%%%%%%%%%%%%%%%%%%%%%%

h6=figure(6)
set(gca, 'FontSize', fsz, 'LineWidth', 1.5 ); 
%set(h(4),'linewidth',2.0);

%subplot(2,1,1)
%plot(plant_time,tank_1, '-.k', 'linewidth', 1.5);
plot(plant_time,noise_no_def_0_5, '-.k', 'linewidth', 1.5);

hold on;
plot(plant_time,noise_def_0_5, '--b', 'linewidth', 1.5);

lg = legend('Normal Operation', 'With SDN Defense', 'FontSize', 8, 'Location','southwest');

axis([0 120 0 1.2])
grid on;

%plot([42 42],[0 1.2], '--k')
%axis([0 120 0 1.2])

%annotation('textarrow',[0.55,0.45],[0.37,0.37],'String','Attack');

xlabel('Time (min)')
ylabel('Tank 1 Level (m)')
title('Water Tank 1 Level Behavior With Gausian Noise');

matlab2tikz('noise_0_5.tikz', 'showInfo', false, 'parseStrings', false, 'standalone', false, 'height', '\figureheight', 'width', '\figurewidth');

%%%%%%%%%%%%%%%%%%%%%%%%% GAUSIAN NOISE ON THE LIT101 1.0 %%%%%%%%%%%%%%%%%%%%%%%%

h7=figure(7)
set(gca, 'FontSize', fsz, 'LineWidth', 1.5 ); 
%set(h(4),'linewidth',2.0);

%subplot(2,1,1)
%plot(plant_time,tank_1, '-.k', 'linewidth', 1.5);
plot(plant_time,noise_no_def_1_0, '-.k', 'linewidth', 1.5);

hold on;
plot(plant_time,noise_def_1_0, '--b', 'linewidth', 1.5);

lg = legend('Normal Operation', 'With SDN Defense', 'FontSize', 8, 'Location','southwest');

axis([0 120 0 1.2])
grid on;

%plot([42 42],[0 1.2], '--k')
%axis([0 120 0 1.2])

%annotation('textarrow',[0.55,0.45],[0.37,0.37],'String','Attack');

xlabel('Time (min)')
ylabel('Tank 1 Level (m)')
title('Water Tank 1 Level Behavior With Gausian Noise 1.0');

matlab2tikz('noise_1_0.tikz', 'showInfo', false, 'parseStrings', false, 'standalone', false, 'height', '\figureheight', 'width', '\figurewidth');

%%%%%%%%%%%%%%%%%%%%%%%% GAUSIAN NOISE ON THE LIT101 0.9 %%%%%%%%%%%%%%%%%%%%%%%%

h8=figure(8)
set(gca, 'FontSize', fsz, 'LineWidth', 1.5 ); 
%set(h(4),'linewidth',2.0);

%subplot(2,1,1)
%plot(plant_time,tank_1, '-.k', 'linewidth', 1.5);
plot(plant_time,noise_no_def_0_9, '-.k', 'linewidth', 1.5);

hold on;
plot(plant_time,noise_def_0_9, '--b', 'linewidth', 1.5);

lg = legend('Normal Operation', 'With SDN Defense', 'FontSize', 8, 'Location','southwest');

axis([0 120 0 1.2])
grid on;

%plot([42 42],[0 1.2], '--k')
%axis([0 120 0 1.2])

%annotation('textarrow',[0.55,0.45],[0.37,0.37],'String','Attack');

xlabel('Time (min)')
ylabel('Tank 1 Level (m)')
title('Water Tank 1 Level Behavior With Gausian Noise 0.9');

matlab2tikz('noise_0_9.tikz', 'showInfo', false, 'parseStrings', false, 'standalone', false, 'height', '\figureheight', 'width', '\figurewidth');

%%%%%%%%%%%%%%%%%%%%%%%%% GAUSIAN NOISE ON THE LIT101 0.8 %%%%%%%%%%%%%%%%%%%%%%%%

h9=figure(9)
set(gca, 'FontSize', fsz, 'LineWidth', 1.5 ); 
%set(h(4),'linewidth',2.0);

%subplot(2,1,1)
%plot(plant_time,tank_1, '-.k', 'linewidth', 1.5);
plot(plant_time,noise_no_def_0_8, '-.k', 'linewidth', 1.5);

hold on;
plot(plant_time,noise_def_0_8, '--b', 'linewidth', 1.5);

lg = legend('Normal Operation', 'With SDN Defense', 'FontSize', 8, 'Location','southwest');

axis([0 120 0 1.2])
grid on;

%plot([42 42],[0 1.2], '--k')
%axis([0 120 0 1.2])

%annotation('textarrow',[0.55,0.45],[0.37,0.37],'String','Attack');

xlabel('Time (min)')
ylabel('Tank 1 Level (m)')
title('Water Tank 1 Level Behavior With Gausian Noise 0.8');

matlab2tikz('noise_0_8.tikz', 'showInfo', false, 'parseStrings', false, 'standalone', false, 'height', '\figureheight', 'width', '\figurewidth');


%%%%%%%%%%%%%%%%%%%%%%%%% GAUSIAN NOISE ON THE LIT101 0.7 %%%%%%%%%%%%%%%%%%%%%%%%

h10=figure(10)
set(gca, 'FontSize', fsz, 'LineWidth', 1.5 ); 
%set(h(4),'linewidth',2.0);

%subplot(2,1,1)
%plot(plant_time,tank_1, '-.k', 'linewidth', 1.5);
plot(plant_time,noise_no_def_0_7, '-.k', 'linewidth', 1.5);

hold on;
plot(plant_time,noise_def_0_7, '--b', 'linewidth', 1.5);

lg = legend('Normal Operation', 'With SDN Defense', 'FontSize', 8, 'Location','southwest');

axis([0 120 0 1.2])
grid on;

%plot([42 42],[0 1.2], '--k')
%axis([0 120 0 1.2])

%annotation('textarrow',[0.55,0.45],[0.37,0.37],'String','Attack');

xlabel('Time (min)')
ylabel('Tank 1 Level (m)')
title('Water Tank 1 Level Behavior With Gausian Noise 0.7');

matlab2tikz('noise_0_7.tikz', 'showInfo', false, 'parseStrings', false, 'standalone', false, 'height', '\figureheight', 'width', '\figurewidth');

%%%%%%%%%%%%%%%%%%%%%%%%% GAUSIAN NOISE ON THE LIT101 0.6 %%%%%%%%%%%%%%%%%%%%%%%%

h11=figure(11)
set(gca, 'FontSize', fsz, 'LineWidth', 1.5 ); 
%set(h(4),'linewidth',2.0);

%subplot(2,1,1)
%plot(plant_time,tank_1, '-.k', 'linewidth', 1.5);
plot(plant_time,noise_no_def_0_6, '-.k', 'linewidth', 1.5);

hold on;
plot(plant_time,noise_def_0_6, '--b', 'linewidth', 1.5);

lg = legend('Normal Operation', 'With SDN Defense', 'FontSize', 8, 'Location','southwest');

axis([0 120 0 1.2])
grid on;

%plot([42 42],[0 1.2], '--k')
%axis([0 120 0 1.2])

%annotation('textarrow',[0.55,0.45],[0.37,0.37],'String','Attack');

xlabel('Time (min)')
ylabel('Tank 1 Level (m)')
title('Water Tank 1 Level Behavior With Gausian Noise 0.6');

matlab2tikz('noise_0_6.tikz', 'showInfo', false, 'parseStrings', false, 'standalone', false, 'height', '\figureheight', 'width', '\figurewidth');

%%%%%%%%%%%%%%%%%%%%%%%%% GAUSIAN NOISE ON THE LIT101 0.4 %%%%%%%%%%%%%%%%%%%%%%%%

h12=figure(12)
set(gca, 'FontSize', fsz, 'LineWidth', 1.5 ); 
%set(h(4),'linewidth',2.0);

%subplot(2,1,1)
%plot(plant_time,tank_1, '-.k', 'linewidth', 1.5);
plot(plant_time,noise_no_def_0_4, '-.k', 'linewidth', 1.5);

hold on;
plot(plant_time,noise_def_0_4, '--b', 'linewidth', 1.5);

lg = legend('Normal Operation', 'With SDN Defense', 'FontSize', 8, 'Location','southwest');

axis([0 120 0 1.2])
grid on;

%plot([42 42],[0 1.2], '--k')
%axis([0 120 0 1.2])

%annotation('textarrow',[0.55,0.45],[0.37,0.37],'String','Attack');

xlabel('Time (min)')
ylabel('Tank 1 Level (m)')
title('Water Tank 1 Level Behavior With Gausian Noise 0.4');

matlab2tikz('noise_0_4.tikz', 'showInfo', false, 'parseStrings', false, 'standalone', false, 'height', '\figureheight', 'width', '\figurewidth');

%%%%%%%%%%%%%%%%%%%%%%%%% GAUSIAN NOISE ON THE LIT101 0.3 %%%%%%%%%%%%%%%%%%%%%%%%

h13=figure(13)
set(gca, 'FontSize', fsz, 'LineWidth', 1.5 ); 
%set(h(4),'linewidth',2.0);

%subplot(2,1,1)
%plot(plant_time,tank_1, '-.k', 'linewidth', 1.5);
plot(plant_time,noise_no_def_0_3, '-.k', 'linewidth', 1.5);

hold on;
plot(plant_time,noise_def_0_3, '--b', 'linewidth', 1.5);

lg = legend('Normal Operation', 'With SDN Defense', 'FontSize', 8, 'Location','southwest');

axis([0 120 0 1.2])
grid on;

%plot([42 42],[0 1.2], '--k')
%axis([0 120 0 1.2])

%annotation('textarrow',[0.55,0.45],[0.37,0.37],'String','Attack');

xlabel('Time (min)')
ylabel('Tank 1 Level (m)')
title('Water Tank 1 Level Behavior With Gausian Noise 0.3');

matlab2tikz('noise_0_3.tikz', 'showInfo', false, 'parseStrings', false, 'standalone', false, 'height', '\figureheight', 'width', '\figurewidth');


%%%%%%%%%%%%%%%%%%%%%%%%% FINAL GAUSIAN NOISE FIGURE %%%%%%%%%%%%%%%%%%%%%%%%

delta=zeros(7,1)

%delta(1) = mean(abs(noise_no_def_0_1 - noise_def_0_1));
%delta(2) = mean(abs(noise_no_def_0_2 - noise_def_0_2));
delta(1) = mean(abs(noise_no_def_0_3 - noise_def_0_3));
delta(2) = mean(abs(noise_no_def_0_4 - noise_def_0_4));
delta(3) = mean(abs(noise_no_def_0_5 - noise_def_0_5));
delta(4) = mean(abs(noise_no_def_0_6 - noise_def_0_6));
delta(5) = mean(abs(noise_no_def_0_7 - noise_def_0_7));
delta(6) = mean(abs(noise_no_def_0_8 - noise_def_0_8));
%delta(9) = mean(abs(noise_no_def_0_9 - noise_def_0_9));
delta(7) = mean(abs(noise_no_def_1_0 - noise_def_1_0));

sigma = [0.3, 0.4, 0.5, 0.6, 0.8, 0.9, 1.0]

h14=figure(14)
set(gca, 'FontSize', fsz, 'LineWidth', 1.5 ); 
%set(h(4),'linewidth',2.0);

%subplot(2,1,1)
%plot(plant_time,tank_1, '-.k', 'linewidth', 1.5);
plot(sigma,delta, '-.k', 'linewidth', 1.5);

%lg = legend('Normal Operation', 'With SDN Defense', 'FontSize', 8, 'Location','southwest');
grid on;

%plot([42 42],[0 1.2], '--k')
%axis([0 120 0 1.2])

%annotation('textarrow',[0.55,0.45],[0.37,0.37],'String','Attack');

xlabel('Time (min)')
ylabel('Tank 1 Level (m)')
title('FINAL Water Tank 1 Level Behavior With Gausian Noise');

matlab2tikz('gaussian_noise.tikz', 'showInfo', false, 'parseStrings', false, 'standalone', false, 'height', '\figureheight', 'width', '\figurewidth');


