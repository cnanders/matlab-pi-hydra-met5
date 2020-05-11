classdef Hydra < AsciiComm
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        
        function this = Hydra(varargin) 
            
            % Call superclass constructor
            this = this@AsciiComm(varargin{:});
            
            this.cConnection = this.cCONNECTION_TCPIP;
            this.u8TerminatorWrite = uint8([13 10]);
            this.u8TerminatorRead = uint8([13 10]);
            
            this.init(); % AsciiComm.init()
            
        end
           
        
        % Sets the motor velocity of an axis
        % @param {uint8 1x1} u8Ch - channel (1 or 2)
        % @param {double 1x1} dVal - velocity in mm/s (20 is good)
        function setVelocity(this, u8Ch, dVal)
            cCmd = sprintf('%1.0f %d snv', u8Ch, dVal);
            this.writeAscii(cCmd);
        end
        
        % Sets the motor accelleration of an axis
        % @param {uint8 1x1} u8Ch - channel (1 or 2)
        % @param {double 1x1} dVal - accedlleration in mm/s/s? 100 is good
        function setAcceleration(this, u8Ch, dVal)
            cCmd = sprintf('%1.0f %d sna', u8Ch, dVal);
            this.writeAscii(cCmd);
        end
        
        % Returns the velocity in mm/2
        % @param {uint8 1x1} u8Ch - channel (1 or 2)
        function d = getVelocity(this, u8Ch)
            cCmd = sprintf('%1.0f gnv', u8Ch);
            this.writeAscii(cCmd);
            d = this.readAscii();
        end
        
        
        % Returns the velocity in mm/2
        % @param {uint8 1x1} u8Ch - channel (1 or 2)
        function d = getAcceleration(this, u8Ch)
            cCmd = sprintf('%1.0f gna', u8Ch);
            this.writeAscii(cCmd);
            d = this.readAscii();
        end
    end
    
end

