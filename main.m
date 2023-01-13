% This plant is modeled in Simulink with commonly used blocks.
mdlPlant = 'pendcartPlant';
load_system(mdlPlant)
open_system([mdlPlant '/Pendulum and Cart System'],'force')

mdlMPC = 'cascade_pendcart';
open_system(mdlMPC)

%% Linear Plant Model
%linearize the Simulink plant model at the initial
% operating point.
%
% Specify linearization input and output points.
%io(1) = linio([mdlPlant '/dF'],1,'openinput');
%io(2) = linio([mdlPlant '/F'],1,'openinput');
%io(3) = linio([mdlPlant '/Pendulum and Cart System'],1,'openoutput');
%io(4) = linio([mdlPlant '/Pendulum and Cart System'],3,'openoutput');

%% Closed-Loop Simulation
% Validate the Cascade design with a closed-loop simulation in Simulink.
open_system([mdlMPC '/Scope'])
sim(mdlMPC)


bdclose(mdlMPC)
