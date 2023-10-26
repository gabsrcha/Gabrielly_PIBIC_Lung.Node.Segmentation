clear

% Diretório de origem
diretorio_origem = 'G:\Gabrielly_PIBIC\Testes\FOutput\0.FINAL\SLICES';

% Diretório de destino
diretorio_destino = 'G:\Gabrielly_PIBIC\Testes\FOutput\0.FINAL\RESTOSLICES';

% Obtém a lista de pastas no diretório de origem
pastas = dir(diretorio_origem);

% Itera sobre cada pasta
for i = 1:numel(pastas)
    % Ignora as entradas '.' e '..'
    if ismember(pastas(i).name, {'.', '..'})
        continue;
    end
    
    % Constrói o caminho completo da pasta atual
    pasta_atual = fullfile(diretorio_origem, pastas(i).name);
    
    % Lista os arquivos na pasta atual
    arquivos = dir(fullfile(pasta_atual, '*.*'));
    
    % Itera sobre cada arquivo na pasta atual
    for j = 1:numel(arquivos)
        % Constrói o caminho completo do arquivo atual
        arquivo_atual = fullfile(pasta_atual, arquivos(j).name);
        
        % Copia o arquivo para o diretório de destino
        destino_atual = fullfile(diretorio_destino, arquivos(j).name);
        copyfile(arquivo_atual, destino_atual);
    end
end

disp('Concluído! Todos os arquivos foram copiados para o diretório de destino.');
