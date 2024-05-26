{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "0e14b52d",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2024-05-26T17:11:54.840686Z",
     "iopub.status.busy": "2024-05-26T17:11:54.838196Z",
     "iopub.status.idle": "2024-05-26T17:11:56.146316Z",
     "shell.execute_reply": "2024-05-26T17:11:56.144180Z"
    },
    "papermill": {
     "duration": 1.31708,
     "end_time": "2024-05-26T17:11:56.149225",
     "exception": false,
     "start_time": "2024-05-26T17:11:54.832145",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.4     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.3     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.2     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "library(lubridate)\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "6fccfdf9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-26T17:11:56.193464Z",
     "iopub.status.busy": "2024-05-26T17:11:56.157679Z",
     "iopub.status.idle": "2024-05-26T17:11:56.212289Z",
     "shell.execute_reply": "2024-05-26T17:11:56.210119Z"
    },
    "papermill": {
     "duration": 0.062558,
     "end_time": "2024-05-26T17:11:56.214983",
     "exception": false,
     "start_time": "2024-05-26T17:11:56.152425",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Inicio do processamento 14:11:56 - Sorteio times dia 26-05-2024 \n"
     ]
    }
   ],
   "source": [
    "cat('Inicio do processamento', format(as.POSIXct(format(now(), tz='UTC+3')), \"%T\"), '- Sorteio times dia', format(today(), tz='UTC+3', format=\"%d-%m-%Y\"),'\\n')\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "726f87b1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-26T17:11:56.225281Z",
     "iopub.status.busy": "2024-05-26T17:11:56.223541Z",
     "iopub.status.idle": "2024-05-26T17:11:56.283248Z",
     "shell.execute_reply": "2024-05-26T17:11:56.281001Z"
    },
    "papermill": {
     "duration": 0.068066,
     "end_time": "2024-05-26T17:11:56.286440",
     "exception": false,
     "start_time": "2024-05-26T17:11:56.218374",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#CODIGO PARA SORTEAR ALEATORIAMENTE OS TIMES SEMANAIS\n",
    "#GERA O ID DOS JOGADORES DE CADA TIME\n",
    "#VIA WPP CADA 1 COLOCA SEU NOME EM ORDEM DE CONFIRMACAO PRA SEMANA \n",
    "\n",
    "timeVermelho = list()\n",
    "timeAzul = list()\n",
    "moeda = 0\n",
    "s = seq(1,18)\n",
    "sorteio = sample(s, 18)\n",
    "k=1\n",
    "\n",
    "while(length(timeVermelho) < 9 || length(timeAzul) < 9){\n",
    "  moeda = runif(1)\n",
    "  if(moeda < 0.5 && length(timeVermelho)<9){\n",
    "    timeVermelho <- append(timeVermelho, sorteio[k])\n",
    "    k = k + 1\n",
    "  }else if(moeda >= 0.5 && length(timeAzul)<9){\n",
    "    timeAzul <- append(timeAzul, sorteio[k])\n",
    "    k = k + 1\n",
    "  }\n",
    "}"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "71bbe33c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-26T17:11:56.297698Z",
     "iopub.status.busy": "2024-05-26T17:11:56.295709Z",
     "iopub.status.idle": "2024-05-26T17:11:56.318758Z",
     "shell.execute_reply": "2024-05-26T17:11:56.316407Z"
    },
    "papermill": {
     "duration": 0.031815,
     "end_time": "2024-05-26T17:11:56.321677",
     "exception": false,
     "start_time": "2024-05-26T17:11:56.289862",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "time Azul - Jogador: 15 \n",
      "time Azul - Jogador: 1 \n",
      "time Azul - Jogador: 12 \n",
      "time Azul - Jogador: 10 \n",
      "time Azul - Jogador: 2 \n",
      "time Azul - Jogador: 8 \n",
      "time Azul - Jogador: 5 \n",
      "time Azul - Jogador: 13 \n",
      "time Azul - Jogador: 6 \n"
     ]
    }
   ],
   "source": [
    "for(i in 1:length(timeAzul)){\n",
    "  cat('time Azul - Jogador:', timeAzul[[i]], '\\n')\n",
    "}\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "edd7b4de",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-26T17:11:56.332384Z",
     "iopub.status.busy": "2024-05-26T17:11:56.330544Z",
     "iopub.status.idle": "2024-05-26T17:11:56.353231Z",
     "shell.execute_reply": "2024-05-26T17:11:56.350859Z"
    },
    "papermill": {
     "duration": 0.030995,
     "end_time": "2024-05-26T17:11:56.356076",
     "exception": false,
     "start_time": "2024-05-26T17:11:56.325081",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "time Vermelho - Jogador 18 \n",
      "time Vermelho - Jogador 9 \n",
      "time Vermelho - Jogador 11 \n",
      "time Vermelho - Jogador 14 \n",
      "time Vermelho - Jogador 17 \n",
      "time Vermelho - Jogador 4 \n",
      "time Vermelho - Jogador 16 \n",
      "time Vermelho - Jogador 3 \n",
      "time Vermelho - Jogador 7 \n"
     ]
    }
   ],
   "source": [
    "for(i in 1:length(timeVermelho)){\n",
    "  cat('time Vermelho - Jogador', timeVermelho[[i]], '\\n')\n",
    "}"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "99e2f3a9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-26T17:11:56.366811Z",
     "iopub.status.busy": "2024-05-26T17:11:56.365106Z",
     "iopub.status.idle": "2024-05-26T17:11:56.383847Z",
     "shell.execute_reply": "2024-05-26T17:11:56.381597Z"
    },
    "papermill": {
     "duration": 0.027234,
     "end_time": "2024-05-26T17:11:56.386761",
     "exception": false,
     "start_time": "2024-05-26T17:11:56.359527",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Fim do processamento 14:11:56 - Sorteio times dia 26-05-2024 \n"
     ]
    }
   ],
   "source": [
    "cat('Fim do processamento', format(as.POSIXct(format(now(), tz='UTC+3')), \"%T\"), '- Sorteio times dia', format(today(), tz='UTC+3', format=\"%d-%m-%Y\"),'\\n')\n"
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [],
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 5.738971,
   "end_time": "2024-05-26T17:11:56.512757",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-05-26T17:11:50.773786",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
