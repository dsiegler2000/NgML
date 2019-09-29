load("matlab.mat");

for i = 1:12
    for j = 1:12
        if i == j
            continue;
        end
        h = figure;
        set(h, 'Visible', 'off');
        scatter(rawData(:, i), rawData(:, j));
        title(sprintf('%d v %d', i, j));
        saveas(gcf, sprintf('figures/%d v %d.png', i, j))
    end
end