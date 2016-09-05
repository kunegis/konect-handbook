%
% Generate the category tabular environment.
%
% PARAMETERS 
%	$NETWORKS
%
% OUTPUT 
%	category-tabular.tex
%

OUT = fopen('category-tabular.tex', 'w');

if (0 > OUT)
    error('fopen'); 
end

fprintf(OUT, '\\begin{tabular}{lllllr}\n');
fprintf(OUT, '\\toprule\n');
fprintf(OUT, ['& \\textbf{Category} & \\textbf{Vertices} & \\textbf{Edges} ' ...
              '& \\textbf{Properties} & \\textbf{Count} \\\\\n']);
fprintf(OUT, '\\midrule\n');

[colors vertices edges] = konect_data_category(); 

categories= fieldnames(colors);
n = length(categories)

% Iterate over all networks


for i = 1 : n
    category= categories{i}
    fprintf(OUT, '\\textcolor{color%s}{$\\newmoon$} &', category); 
    fprintf(OUT, '%s & ', category);
    fprintf(OUT, '%s & %s & ', vertices.(category), edges.(category)); 
    fprintf(OUT, '\\\\\n'); 
end

fprintf(OUT, '\\bottomrule\n');
fprintf(OUT, '\\end{tabular}\n'); 

if (0 > fclose(OUT))
    error('fclose'); 
end