classdef AbstractHydra < handle
    
    
    methods
        
        
        
        % Sets the motor velocity of an axis
        % @param {uint8 1x1} u8Ch - channel (1 or 2)
        % @param {double 1x1} dVal - velocity in mm/s (20 is good)
        setVelocity(this, u8Ch, dVal)
        
        % Sets the motor accelleration of an axis
        % @param {uint8 1x1} u8Ch - channel (1 or 2)
        % @param {double 1x1} dVal - accedlleration in mm/s/s? 100 is good
        setAcceleration(this, u8Ch, dVal)
        setDeceleration(this, u8Ch, dVal)
        
        % Returns the velocity in mm/2
        % @param {uint8 1x1} u8Ch - channel (1 or 2)
        d = getVelocity(this, u8Ch)
        
        % Returns the velocity in mm/2
        % @param {uint8 1x1} u8Ch - channel (1 or 2)
        d = getAcceleration(this, u8Ch)
        d = getDeceleration(this, u8Ch)
        
    end
    
end

