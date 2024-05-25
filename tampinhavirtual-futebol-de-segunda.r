{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "51ba0b02",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2024-05-25T23:07:48.397358Z",
     "iopub.status.busy": "2024-05-25T23:07:48.395262Z",
     "iopub.status.idle": "2024-05-25T23:07:49.705139Z",
     "shell.execute_reply": "2024-05-25T23:07:49.703259Z"
    },
    "papermill": {
     "duration": 1.317005,
     "end_time": "2024-05-25T23:07:49.707852",
     "exception": false,
     "start_time": "2024-05-25T23:07:48.390847",
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
   "id": "3cccd2c8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T23:07:49.745697Z",
     "iopub.status.busy": "2024-05-25T23:07:49.714272Z",
     "iopub.status.idle": "2024-05-25T23:07:49.788760Z",
     "shell.execute_reply": "2024-05-25T23:07:49.786922Z"
    },
    "papermill": {
     "duration": 0.081256,
     "end_time": "2024-05-25T23:07:49.791489",
     "exception": false,
     "start_time": "2024-05-25T23:07:49.710233",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
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
   "id": "2656badc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T23:07:49.799153Z",
     "iopub.status.busy": "2024-05-25T23:07:49.797661Z",
     "iopub.status.idle": "2024-05-25T23:07:49.826313Z",
     "shell.execute_reply": "2024-05-25T23:07:49.824467Z"
    },
    "papermill": {
     "duration": 0.035703,
     "end_time": "2024-05-25T23:07:49.829315",
     "exception": false,
     "start_time": "2024-05-25T23:07:49.793612",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "time Azul - Jogador: 9 \n",
      "time Azul - Jogador: 13 \n",
      "time Azul - Jogador: 16 \n",
      "time Azul - Jogador: 12 \n",
      "time Azul - Jogador: 11 \n",
      "time Azul - Jogador: 7 \n",
      "time Azul - Jogador: 3 \n",
      "time Azul - Jogador: 15 \n",
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
   "execution_count": 4,
   "id": "e6057c9f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-05-25T23:07:49.838273Z",
     "iopub.status.busy": "2024-05-25T23:07:49.835985Z",
     "iopub.status.idle": "2024-05-25T23:07:49.860122Z",
     "shell.execute_reply": "2024-05-25T23:07:49.857533Z"
    },
    "papermill": {
     "duration": 0.031908,
     "end_time": "2024-05-25T23:07:49.863385",
     "exception": false,
     "start_time": "2024-05-25T23:07:49.831477",
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
      "time Vermelho - Jogador 18 \n",
      "time Vermelho - Jogador 1 \n",
      "time Vermelho - Jogador 8 \n",
      "time Vermelho - Jogador 5 \n",
      "time Vermelho - Jogador 4 \n",
      "time Vermelho - Jogador 14 \n",
      "time Vermelho - Jogador 2 \n",
      "time Vermelho - Jogador 17 \n"
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
   "dockerImageVersionId": 30618,
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
   "duration": 5.497919,
   "end_time": "2024-05-25T23:07:49.989870",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-05-25T23:07:44.491951",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
