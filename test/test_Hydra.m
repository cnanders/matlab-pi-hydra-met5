[cDirThis, cName, cExt] = fileparts(mfilename('fullpath'));
cDirSrc = fullfile(cDirThis,  '..', 'src');
addpath(genpath(cDirSrc));


cDirMpm = fullfile(cDirThis, '..', 'mpm-packages');
addpath(genpath(cDirMpm));

comm = pi.Hydra(...
    'cTcpipHost', '192.168.10.11', ...
    'u16TcpipPort', uint16(400) ...
);

comm.clearBytesAvailable();
comm.getVelocity(1)
comm.getAcceleration(1)
comm.setAcceleration(1, 90)
comm.getAcceleration(1)
delete(comm);