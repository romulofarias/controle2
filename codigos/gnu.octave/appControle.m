close all; clear all; clc;
graphics_toolkit qt;
f = figure("name","Sistemas de Controle - Grupo 3",'numbertitle','off');
#uialert(h.f,'Olá! Este programa foi desenvolvido pelo Grupo 3 de Sistemas de Controle',...
#'Informação','icon','info','closefcn','uiresume(h.f)');
# Organizando a tela em paineis
# painel do controlador
ctrlPanel = uipanel("title","Configuração do controlador","position",[0.02 0.8 0.38 0.18],"units","normalized");
kp_label = uicontrol("parent",ctrlPanel,"style","text","string", "Kp", "position",[0.04 0.802 0.10 0.12]);
kp_edtxt = uicontrol("parent",ctrlPanel,"style","edit","string","","position",[0.12 0.802 0.10 0.12]);
#ki_label = uicontrol("parent",control_panel,"style","text","position",[]);
#ki_edtxt = uicontrol("parent",control_panel,"style","text","position",[]);
#kd_label = uicontrol("parent",control_panel,"style","text","position",[]);
#kd_edtxt = uicontrol("parent",control_panel,"style","text","position",[]);
#painel do monitor
monitor_panel = uipanel("title","Monitor","position",[0.02 0.06 0.38 0.74],"units","normalized");
#painel de gráficos
graphic_panel = uipanel("title","Gráficos","position",[0.402 0.06 0.58 0.92],"units","normalized");

#
#function HandlerControl(obj,init = false)
#    h = guidata(obj)
#    switch gcbo
#        case h.pushbtn1
#            set(h.text,"string",num2str(rand));
#        case h.pushbtn2
#            close(h.f)
#    end
#end

#h.text = uicontrol("style","text","string","0.1368","callback","","units","normalized","position",[0.6 0.8 0.35 0.08]);
btn1 = uicontrol("style","pushbutton","string","Random","callback",@HandlerControl,"units","normalized","position",[0.77 0.02 0.1 0.04]);
btn2 = uicontrol("style","pushbutton","string","Sair","callback",@HandlerControl,"units","normalized","position",[0.88 0.02 0.1 0.04]);
set(gcf,"color",get(0,"defaultuicontrolbackgroundcolor"));
#guidata(h.f,h);
#HandlerControl(gcf,true);

