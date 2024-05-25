{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "c9acee2f",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2024-05-25T23:17:47.513014Z",
     "iopub.status.busy": "2024-05-25T23:17:47.509495Z",
     "iopub.status.idle": "2024-05-25T23:17:48.888581Z",
     "shell.execute_reply": "2024-05-25T23:17:48.886564Z"
    },
    "papermill": {
     "duration": 1.390226,
     "end_time": "2024-05-25T23:17:48.892352",
     "exception": false,
     "start_time": "2024-05-25T23:17:47.502126",
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
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "8ac9a1b8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T23:17:48.933269Z",
     "iopub.status.busy": "2024-05-25T23:17:48.899651Z",
     "iopub.status.idle": "2024-05-25T23:17:48.978497Z",
     "shell.execute_reply": "2024-05-25T23:17:48.976558Z"
    },
    "papermill": {
     "duration": 0.085964,
     "end_time": "2024-05-25T23:17:48.981071",
     "exception": false,
     "start_time": "2024-05-25T23:17:48.895107",
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
   "execution_count": 3,
   "id": "61d07b55",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T23:17:48.989354Z",
     "iopub.status.busy": "2024-05-25T23:17:48.987820Z",
     "iopub.status.idle": "2024-05-25T23:17:49.017735Z",
     "shell.execute_reply": "2024-05-25T23:17:49.015725Z"
    },
    "papermill": {
     "duration": 0.036753,
     "end_time": "2024-05-25T23:17:49.020366",
     "exception": false,
     "start_time": "2024-05-25T23:17:48.983613",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "time Azul - Jogador: 2 \n",
      "time Azul - Jogador: 1 \n",
      "time Azul - Jogador: 7 \n",
      "time Azul - Jogador: 16 \n",
      "time Azul - Jogador: 11 \n",
      "time Azul - Jogador: 5 \n",
      "time Azul - Jogador: 3 \n",
      "time Azul - Jogador: 17 \n",
      "time Azul - Jogador: 8 \n"
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
   "execution_count": 4,
   "id": "bbcf0e23",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T23:17:49.029204Z",
     "iopub.status.busy": "2024-05-25T23:17:49.027625Z",
     "iopub.status.idle": "2024-05-25T23:17:49.047654Z",
     "shell.execute_reply": "2024-05-25T23:17:49.045544Z"
    },
    "papermill": {
     "duration": 0.027114,
     "end_time": "2024-05-25T23:17:49.050136",
     "exception": false,
     "start_time": "2024-05-25T23:17:49.023022",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "time Vermelho - Jogador 10 \n",
      "time Vermelho - Jogador 6 \n",
      "time Vermelho - Jogador 14 \n",
      "time Vermelho - Jogador 9 \n",
      "time Vermelho - Jogador 4 \n",
      "time Vermelho - Jogador 15 \n",
      "time Vermelho - Jogador 18 \n",
      "time Vermelho - Jogador 12 \n",
      "time Vermelho - Jogador 13 \n"
     ]
    }
   ],
   "source": [
    "for(i in 1:length(timeVermelho)){\n",
    "  cat('time Vermelho - Jogador', timeVermelho[[i]], '\\n')\n",
    "}"
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
   "duration": 5.203222,
   "end_time": "2024-05-25T23:17:49.173966",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-05-25T23:17:43.970744",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
