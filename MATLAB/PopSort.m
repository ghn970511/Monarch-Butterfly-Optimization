function [Population, indices] = PopSort(Population)

% Sort the population members from best to worst
popsize = length(Population);
Cost = zeros(1, popsize);
indices = zeros(1, popsize);
for i = 1 : popsize
    Cost(i) = Population(i).cost;
end
[Cost, indices] = sort(Cost, 2, 'ascend');
Chroms = zeros(popsize, length(Population(1).chrom));
for i = 1 : popsize
    Chroms(i, :) = Population(indices(i)).chrom;
end
for i = 1 : popsize
    Population(i).chrom = Chroms(i, :);
    Population(i).cost = Cost(i);
end