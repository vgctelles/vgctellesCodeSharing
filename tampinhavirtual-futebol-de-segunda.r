{"metadata":{"kernelspec":{"name":"ir","display_name":"R","language":"R"},"language_info":{"name":"R","codemirror_mode":"r","pygments_lexer":"r","mimetype":"text/x-r-source","file_extension":".r","version":"4.0.5"},"kaggle":{"accelerator":"none","dataSources":[],"dockerImageVersionId":30618,"isInternetEnabled":true,"language":"r","sourceType":"notebook","isGpuEnabled":false}},"nbformat_minor":4,"nbformat":4,"cells":[{"cell_type":"code","source":"# This R environment comes with many helpful analytics packages installed\n# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n# For example, here's a helpful package to load\n\nlibrary(tidyverse) # metapackage of all tidyverse packages\n\n# Input data files are available in the read-only \"../input/\" directory\n# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory","metadata":{"_uuid":"051d70d956493feee0c6d64651c6a088724dca2a","_execution_state":"idle","execution":{"iopub.status.busy":"2024-05-25T22:56:54.694238Z","iopub.execute_input":"2024-05-25T22:56:54.696349Z","iopub.status.idle":"2024-05-25T22:56:55.945661Z"},"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"code","source":"timeVermelho = list()\ntimeAzul = list()\nmoeda = 0\ns = seq(1,18)\nsorteio = sample(s, 18)\nk=1\n\nwhile(length(timeVermelho) < 9 || length(timeAzul) < 9){\n  moeda = runif(1)\n  if(moeda < 0.5 && length(timeVermelho)<9){\n    timeVermelho <- append(timeVermelho, sorteio[k])\n    k = k + 1\n  }else if(moeda >= 0.5 && length(timeAzul)<9){\n    timeAzul <- append(timeAzul, sorteio[k])\n    k = k + 1\n  }\n}","metadata":{"execution":{"iopub.status.busy":"2024-05-25T22:56:55.948490Z","iopub.execute_input":"2024-05-25T22:56:55.980494Z","iopub.status.idle":"2024-05-25T22:56:56.032092Z"},"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"code","source":"for(i in 1:length(timeAzul)){\n  cat('time Azul - Jogador:', timeAzul[[i]], '\\n')\n}\n","metadata":{"execution":{"iopub.status.busy":"2024-05-25T22:56:56.035088Z","iopub.execute_input":"2024-05-25T22:56:56.036615Z","iopub.status.idle":"2024-05-25T22:56:56.056386Z"},"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"code","source":"for(i in 1:length(timeVermelho)){\n  cat('time Vermelho - Jogador', timeVermelho[[i]], '\\n')\n}","metadata":{"execution":{"iopub.status.busy":"2024-05-25T22:56:56.059169Z","iopub.execute_input":"2024-05-25T22:56:56.060683Z","iopub.status.idle":"2024-05-25T22:56:56.079310Z"},"trusted":true},"execution_count":null,"outputs":[]}]}