appendl([],X,X).                            % your 2nd line
appendl([X|Y],Z,[X|W]) :- appendl(Y,Z,W).    % your first line
