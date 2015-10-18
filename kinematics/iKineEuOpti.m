function jd_opt = iKineEuOpti(desLoc, jd0, config)
% If no config chosen use the default (0) one.
if (nargin < 3)
    config = 0;
end
% Joint constraints
lb = [-150; -100; -150; -100; -150; -100; -150];
ub = -lb;
% fmincon options
options = optimoptions('fmincon', 'Display', 'off');
%constrained optimisation
jd_opt = fmincon(@sumsqr, jd0,[],[],[],[], lb, ub,[], options);
% error = sumsqr(jd_opt) + 3;
    function F = sumsqr(jd)
        if(config == 0)
            [compPos,compOri] = fKineEu(jd);
        else
            [compPos,compOri] = fKineEuInv(jd);
        end
        compLoc = [compPos;compOri];
        % Norm of position difference (desired - computed).
        F = norm(desLoc - compLoc);
    end
end