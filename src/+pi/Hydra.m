classdef Hydra < AsciiComm & pi.AbstractHydra
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        
        function this = Hydra(varargin) 
            
            % Call superclass constructor
            this = this@AsciiComm(varargin{:});
            
            this.cConnection = this.cCONNECTION_TCPCLIENT;
            this.u8TerminatorWrite = uint8([13 10]);
            this.u8TerminatorRead = uint8([13 10]);
            
            this.init(); % AsciiComm.init()
            
        end
           
        
        % Sets the motor velocity of an axis
        % @param {uint8 1x1} u8Ch - channel (1 or 2)
        % @param {double 1x1} dVal - velocity in mm/s (20 is good)
        function setVelocity(this, u8Ch, dVal)
            cCmd = sprintf('%1.0f %d snv', dVal, u8Ch);
            this.writeAscii(cCmd);
        end
        
        % Sets the motor accelleration of an axis in mm/s/s
        % Default is 60 Range: 0.001 ... 500000.0 
        % @param {uint8 1x1} u8Ch - channel (1 or 2)
        % @param {double 1x1} dVal - accedlleration in mm/s/s 60 is default
        function setAcceleration(this, u8Ch, dVal)
            cCmd = sprintf('%1.0f %d sna', dVal,  u8Ch);
            this.writeAscii(cCmd);
        end
        
        % Sets the motor decelleration of an axis
        % Default is 60 Range: 0.001 ... 500000.0
        % @param {uint8 1x1} u8Ch - channel (1 or 2)
        % @param {double 1x1} dVal - accedlleration in mm/s/s? 100 is good
        function setDeceleration(this, u8Ch, dVal)
            cCmd = sprintf('%1.0f %d ssd', dVal,  u8Ch); % set stop decel
            this.writeAscii(cCmd);
        end
        
        % Returns the velocity in mm/s
        % @param {uint8 1x1} u8Ch - channel (1 or 2)
        function d = getVelocity(this, u8Ch)
            cCmd = sprintf('%d gnv', u8Ch);
            this.writeAscii(cCmd);
            c = this.readAscii();
            d = str2double(c);
        end
        
        
        % Returns the velocity in mm/s
        % @param {uint8 1x1} u8Ch - channel (1 or 2)
        function d = getAcceleration(this, u8Ch)
            cCmd = sprintf('%d gna', u8Ch);
            this.writeAscii(cCmd);
            c = this.readAscii();
            d = str2double(c);
        end
        
        % Returns the stop deceleration in mm/s/s
        % Default is 60 Range: 0.001 ... 500000.0
        % @param {uint8 1x1} u8Ch - channel (1 or 2)
        function d = getDeceleration(this, u8Ch)
            cCmd = sprintf('%d gsd', u8Ch);
            this.writeAscii(cCmd);
            c = this.readAscii();
            d = str2double(c);
        end
    end
    
end

