[cDirThis, cName, cExt] = fileparts(mfilename('fullpath'));
cDirSrc = fullfile(cDirThis,  '..', 'src');
addpath(genpath(cDirSrc));


cDirMpm = fullfile(cDirThis, '..', 'mpm-packages');
addpath(genpath(cDirMpm));

comm = pi.Hydra(...
    'cTcpipHost', '192.169.10.11', ...
    'cConnection', pi.Hydra.cCONNECTION_TCPCLIENT ...
);

comm.getVelocity(1);
delete(comm);