
function EEG = pop_sereega_plot_headmodel(EEG)

if ~isfield(EEG.etc.sereega, 'leadfield') || isempty(EEG.etc.sereega.leadfield)
    error('lead field not available');
end

[~, ~, ~, structout] = inputgui( ...
        'geometry', { 1 1 [1 2] 1 [1 2] [1 2] 1 [1 2]}, ...
        'geomvert', [1 1 1 1 1 1 1 1], ...
        'uilist', { ...
                { 'style', 'text', 'string', 'Plot head model', 'fontweight', 'bold' }, ...
                { }, ...
                { 'style', 'text', 'string', 'Labels' }, ...
                { 'style', 'checkbox', 'string', 'Plot channel labels', 'value', 1, 'tag', 'labels' }, ...
                { }, ...
                { 'style', 'text', 'string', 'Style' }, ...
                { 'style', 'popupmenu', 'string', 'scatter|boundary', 'tag', 'style' }, ...
                { 'style', 'text', 'string', 'Shrink factor' }, ...
                { 'style', 'edit', 'string', '1', 'tag', 'shrink' }, ...
                { }, ...
                { 'style', 'text', 'string', 'Viewpoint' }, ...
                { 'style', 'edit', 'string', '120, 20', 'tag', 'view' }, ...
                }, ... 
        'helpcom', 'pophelp(''plot_headmodel'');', 'title', 'Plot head model');

if ~isempty(structout)
    % user pressed OK
    styles = {'scatter', 'boundary'};    
    plot_headmodel(EEG.etc.sereega.leadfield, 'labels', structout.labels, 'style', styles{structout.style}, 'shrink', str2double(structout.shrink), 'view', str2double(structout.view));
end

end

