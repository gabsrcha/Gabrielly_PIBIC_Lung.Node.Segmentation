function FuncSEPARA(get, slice, nomeArquivoDir, this, pasta,tabnod, subpasta,j, arqmask)
newfolder= strcat('G:\Gabrielly_PIBIC\Testes\FOutput\',string(nomeArquivoDir));
mkdir(newfolder);
newfolder_masks= strcat('G:\Gabrielly_PIBIC\Testes\FOutput\',string(nomeArquivoDir),'\',string(tabnod.Var3(j)));
mkdir(newfolder_masks)
i=0;
getsize_mask= size(get,4);
param = getsize_mask/2;
    contneg=1;
    contpos=1;
for i=1:size(get,4)
    if i<=param
            slices=slice-contneg;
            contneg=contneg+1;
%% MASCARAS BASE
get_MASKS = get(:,:,:,i);
imshow(get_MASKS,[]);
rename2 = strcat(newfolder_masks,'\',string(arqmask(3).name),'-', string(this), '-', string(tabnod.Var3(j)));
imwrite(mat2gray(get_MASKS),strcat(rename2,'-',string(i),'.png'),"png");
%% SLICES BASE
                cd 'G:\Gabrielly_PIBIC\Dataset_Pulmao\LIDC-IDRI\' 
                cd(nomeArquivoDir)
                        for k=3:4
                            if k>size(pasta)
                            break
                            end
            
                            cd(pasta(k).name)
                            subpasta = dir;
                                if ~isempty(strfind(subpasta(3).name,string(tabnod.Var2(j)))) 
                                    cd(subpasta(3).name)
                                    listaarq = dir;
            
                                    if slices<100
                                        slcall = strcat('1-0',string(slices));
                                    else
                                        slcall = strcat('1-',string(slices));
                                    end
    
                                    dcm_file = which(strcat(slcall,'.dcm'));
                                
                                    if isempty(dcm_file)
                                        break
                                    end
                                getslices=dicomread(dcm_file);
                                getslice0=mat2gray(getslices);
                                renameslices2=strcat(newfolder,'\', strcat(slcall,'-', string(i),'.dcm'),'-', string(tabnod.Var3(j)));
                                imad = imadjust(getslice0, stretchlim(getslice0, [0.01, 0.99]), [], 1.5);
                                imshow(imad,[]);
                                disp(dcm_file)

%                                     cd(newfolder);
%                                     verify=dir;
%                                     for j=1:size(verify,1)
%                                        looks = contains(verify(j).name,slcall);
%                                     if looks == 1
%                                         break
%                                     end
%                                     end
%                                 cd 'G:\Gabrielly_PIBIC\Dataset_Pulmao\LIDC-IDRI\' 
%                                 cd(nomeArquivoDir)
%                                 cd(pasta(k).name)
%                                 cd(subpasta(3).name)
%                                 
                                imwrite(imad,strcat(renameslices2,'.png'),"png");
                                cd ..
                                cd ..
                            
                                else
                            cd ..
                                end 
                        
                        end
    end

            if i>param
                slices=slice+contpos;
                contpos=contpos+1;

%% MASCARAS BASE                
get_MASKS = get(:,:,:,i);
rename2 = strcat(newfolder_masks,'\',string(arqmask(3).name),'-', string(this), '-', string(tabnod.Var3(j)));
imwrite(mat2gray(get_MASKS),strcat(rename2,'-',string(i),'.png'),"png");
%% SLICES BASE
                    cd 'G:\Gabrielly_PIBIC\Dataset_Pulmao\LIDC-IDRI\' 
                    cd(nomeArquivoDir)
                            for k=3:4
                                if k>size(pasta)
                                break
                                end
                
                                cd(pasta(k).name)
                                subpasta = dir;
                                    if ~isempty(strfind(subpasta(3).name,string(tabnod.Var2(j)))) 
                                        cd(subpasta(3).name)
                                        listaarq = dir;
                
                                        if slices<100
                                            slcall = strcat('1-0',string(slices));
                                        else
                                            slcall = strcat('1-',string(slices));
                                        end
        
                                        dcm_file = which(strcat(slcall,'.dcm'));
                                    
                                        if isempty(dcm_file)
                                            break
                                        end
                                    getslices=dicomread(dcm_file);
                                    getslice0=mat2gray(getslices);
%                                     renameslices=strcat(cp,'\', strcat(slcall,'-', string(i),'.dcm'),'-', string(tabnod.Var3(j)));
                                    renameslices2=strcat(newfolder,'\', strcat(slcall,'-', string(i),'.dcm'),'-', string(tabnod.Var3(j)));                                    
                                    imad = imadjust(getslice0, stretchlim(getslice0, [0.01, 0.99]), [], 1.5);
                                    imshow(imad,[]);
                                    disp(dcm_file)


%                                         cd(newfolder);
%                                         verify=dir;
%                                         for j=1:size(verify,1)
%                                            looks = contains(verify(j).name,slcall);
%                                         if looks == 1
%                                             break
%                                         end
%                                         end
%                                         cd 'G:\Gabrielly_PIBIC\Dataset_Pulmao\LIDC-IDRI\' 
%                                         cd(nomeArquivoDir)
%                                         cd(pasta(k).name)
%                                         cd(subpasta(3).name)

                                    imwrite(imad,strcat(renameslices2,'.png'),"png");
                                    cd ..
                                    cd ..
                                
                                    else
                                cd ..
                                    end 
                            
                            end

            end




end
end