classdef HydraVirtual < AsciiComm & pi.AbstractHydra
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties (Access = private)
        
        dVelocity = [19 21]
        dAcceleration = [99 101]
        dDeceleration = [89 80]
        
    end
    
    methods
        
        function this = HydraVirtual(varargin) 
 
        end

        function setVelocity(this, u8Ch, dVal)
            this.dVelocity(u8Ch) = dVal;
        end
        
        % Sets the motor accelleration of an axis
        % @param {uint8 1x1} u8Ch - channel (1 or 2)
        % @param {double 1x1} dVal - accedlleration in mm/s/s? 100 is good
        function setAcceleration(this, u8Ch, dVal)
            this.dAcceleration(u8Ch) = dVal;
        end
        function setDeceleration(this, u8Ch, dVal)
            this.dDeceleration(u8Ch) = dVal;
        end
        % Returns the velocity in mm/2
        % @param {uint8 1x1} u8Ch - channel (1 or 2)
        function d = getVelocity(this, u8Ch)
            d = this.dVelocity(u8Ch);
        end
        
        
        % Returns the velocity in mm/2
        % @param {uint8 1x1} u8Ch - channel (1 or 2)
        function d = getAcceleration(this, u8Ch)
            d = this.dAcceleration(u8Ch);
        end
        function d = getDeceleration(this, u8Ch)
            d = this.dDeceleration(u8Ch);
        end
    end
    
end

