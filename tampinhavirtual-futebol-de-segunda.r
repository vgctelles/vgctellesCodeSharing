{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "27239e0d",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2024-05-26T17:18:41.719965Z",
     "iopub.status.busy": "2024-05-26T17:18:41.717533Z",
     "iopub.status.idle": "2024-05-26T17:18:43.005270Z",
     "shell.execute_reply": "2024-05-26T17:18:43.003215Z"
    },
    "papermill": {
     "duration": 1.296829,
     "end_time": "2024-05-26T17:18:43.008344",
     "exception": false,
     "start_time": "2024-05-26T17:18:41.711515",
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
   "id": "8f448f2d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-26T17:18:43.052516Z",
     "iopub.status.busy": "2024-05-26T17:18:43.017465Z",
     "iopub.status.idle": "2024-05-26T17:18:43.071129Z",
     "shell.execute_reply": "2024-05-26T17:18:43.068859Z"
    },
    "papermill": {
     "duration": 0.062035,
     "end_time": "2024-05-26T17:18:43.073885",
     "exception": false,
     "start_time": "2024-05-26T17:18:43.011850",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Inicio do processamento 14:18:43 - Sorteio times dia 26-05-2024 \n"
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
   "id": "fb1355d6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-26T17:18:43.084451Z",
     "iopub.status.busy": "2024-05-26T17:18:43.082660Z",
     "iopub.status.idle": "2024-05-26T17:18:43.138200Z",
     "shell.execute_reply": "2024-05-26T17:18:43.136175Z"
    },
    "papermill": {
     "duration": 0.063863,
     "end_time": "2024-05-26T17:18:43.141100",
     "exception": false,
     "start_time": "2024-05-26T17:18:43.077237",
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
   "id": "9d1d8924",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-26T17:18:43.151513Z",
     "iopub.status.busy": "2024-05-26T17:18:43.149737Z",
     "iopub.status.idle": "2024-05-26T17:18:43.171575Z",
     "shell.execute_reply": "2024-05-26T17:18:43.169358Z"
    },
    "papermill": {
     "duration": 0.029755,
     "end_time": "2024-05-26T17:18:43.174196",
     "exception": false,
     "start_time": "2024-05-26T17:18:43.144441",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "time Azul - Jogador: 12 \n",
      "time Azul - Jogador: 17 \n",
      "time Azul - Jogador: 1 \n",
      "time Azul - Jogador: 13 \n",
      "time Azul - Jogador: 18 \n",
      "time Azul - Jogador: 7 \n",
      "time Azul - Jogador: 2 \n",
      "time Azul - Jogador: 15 \n",
      "time Azul - Jogador: 4 \n"
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
   "id": "d0377a70",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-26T17:18:43.185299Z",
     "iopub.status.busy": "2024-05-26T17:18:43.183307Z",
     "iopub.status.idle": "2024-05-26T17:18:48.204715Z",
     "shell.execute_reply": "2024-05-26T17:18:48.202599Z"
    },
    "papermill": {
     "duration": 5.029883,
     "end_time": "2024-05-26T17:18:48.207535",
     "exception": false,
     "start_time": "2024-05-26T17:18:43.177652",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "Sys.sleep(5)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "1112a88b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-26T17:18:48.218592Z",
     "iopub.status.busy": "2024-05-26T17:18:48.216750Z",
     "iopub.status.idle": "2024-05-26T17:18:48.238428Z",
     "shell.execute_reply": "2024-05-26T17:18:48.236091Z"
    },
    "papermill": {
     "duration": 0.030007,
     "end_time": "2024-05-26T17:18:48.241092",
     "exception": false,
     "start_time": "2024-05-26T17:18:48.211085",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "time Vermelho - Jogador 6 \n",
      "time Vermelho - Jogador 5 \n",
      "time Vermelho - Jogador 3 \n",
      "time Vermelho - Jogador 11 \n",
      "time Vermelho - Jogador 8 \n",
      "time Vermelho - Jogador 10 \n",
      "time Vermelho - Jogador 9 \n",
      "time Vermelho - Jogador 16 \n",
      "time Vermelho - Jogador 14 \n"
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
   "execution_count": 7,
   "id": "fbdabd3f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-26T17:18:48.252167Z",
     "iopub.status.busy": "2024-05-26T17:18:48.250328Z",
     "iopub.status.idle": "2024-05-26T17:18:48.268523Z",
     "shell.execute_reply": "2024-05-26T17:18:48.266341Z"
    },
    "papermill": {
     "duration": 0.026398,
     "end_time": "2024-05-26T17:18:48.271093",
     "exception": false,
     "start_time": "2024-05-26T17:18:48.244695",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Fim do processamento 14:18:48 - Sorteio times dia 26-05-2024 \n"
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
   "duration": 10.450562,
   "end_time": "2024-05-26T17:18:48.397771",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-05-26T17:18:37.947209",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
