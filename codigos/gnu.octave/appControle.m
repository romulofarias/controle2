# GNU Octave 7.3.0
close all; clear all; clc;
graphics_toolkit qt;
h.f = figure("name","Sistemas de Controle - Grupo 3",'numbertitle','off');
#uialert(h.f,'Olá! Este programa foi desenvolvido pelo Grupo 3 de Sistemas de Controle',...
#'Informação','icon','info','closefcn','uiresume(h.f)');
# Organizando a tela em paineis
# painel do controlador
h.ctrlPanel = uipanel(h.f,"units","normalized","title","Configuração do controlador","position",[0.02 0.8 0.38 0.18]);
h.kp_label = uicontrol(h.ctrlPanel,"units","normalized","style","text","string", "Kp", "position",[0.02 0.65 0.1 0.25]);
h.kp_edtxt = uicontrol(h.ctrlPanel,"units","normalized","style","edit","string","","position",[0.1 0.65 0.2 0.25]);
h.ki_label = uicontrol(h.ctrlPanel,"units","normalized","style","text","string", "Ki", "position",[0.30 0.65 0.1 0.25]);
h.ki_edtxt = uicontrol(h.ctrlPanel,"units","normalized","style","edit","string","","position",[0.38 0.65 0.2 0.25]);
h.kd_label = uicontrol(h.ctrlPanel,"units","normalized","style","text","string", "Kd", "position",[0.58 0.65 0.1 0.25]);
h.kd_edtxt = uicontrol(h.ctrlPanel,"units","normalized","style","edit","string","","position",[0.66 0.65 0.2 0.25]);

h.select_L1 = uicontrol(h.ctrlPanel,"units","normalized","style","radiobutton","callback",@HandlerControl,"string","L1","position",[0.25 0.15 0.1 0.1]);
h.select_L2 = uicontrol(h.ctrlPanel,"units","normalized","style","radiobutton","callback",@HandlerControl,"string","L2","position",[0.50 0.15 0.1 0.1]);
#painel do monitor
h.monitor_panel = uipanel("title","Monitor","position",[0.02 0.06 0.38 0.74],"units","normalized");
#painel de gráficos
h.graphic_panel = uipanel("title","Gráficos","position",[0.402 0.06 0.58 0.92],"units","normalized");
#gráfico da resposta autêntica do sistema
h.g_real = uipanel(h.graphic_panel,"title","Real","position",[0 0.5 1 0.498],"units","normalized","titleposition","centertop");
h.ax1 = axes(h.g_real, "position",[0.13 0.15 0.775 0.815]);
h.gp1 = uibuttongroup(h.g_real, "position",[0 0 1 0.08]);
h.gp1_ckb1 = uicontrol(h.gp1, "units","normalized","style","checkbox","string","L1","position",[0.1 0.3 0.5 0.5]);
h.gp1_ckb2 = uicontrol(h.gp1, "units","normalized","style","checkbox","string","L2","position",[0.3 0.3 0.5 0.5]);
h.gp1_ckb3 = uicontrol(h.gp1, "units","normalized","style","checkbox","string","SetPoint","position",[0.5 0.3 0.5 0.5]);
h.gp1_ckb4 = uicontrol(h.gp1, "units","normalized","style","checkbox","string","Controle","position",[0.7 0.3 0.5 0.5]);
h.gp1_ckb5 = uicontrol(h.gp1, "units","normalized","style","checkbox","string","Erro","position",[0.9 0.3 0.5 0.5]);


#gráfico da resposta simulada do sistema
h.g_sim = uipanel(h.graphic_panel,"title","Simulado","position",[0 0 1 0.5],"units","normalized","titleposition","centertop");
h.ax2 = axes(h.g_sim, "position",[0.13 0.15 0.775 0.815]);
h.gp2 = uibuttongroup(h.g_sim, "position",[0 0 1 0.08]);
h.gp2_ckb1 = uicontrol(h.gp2, "units","normalized","style","checkbox","string","L1","position",[0.1 0.3 0.5 0.5]);
h.gp2_ckb2 = uicontrol(h.gp2, "units","normalized","style","checkbox","string","L2","position",[0.3 0.3 0.5 0.5]);
h.gp2_ckb3 = uicontrol(h.gp2, "units","normalized","style","checkbox","string","SetPoint","position",[0.5 0.3 0.5 0.5]);
h.gp2_ckb4 = uicontrol(h.gp2, "units","normalized","style","checkbox","string","Controle","position",[0.7 0.3 0.5 0.5]);
h.gp2_ckb5 = uicontrol(h.gp2, "units","normalized","style","checkbox","string","Erro","position",[0.9 0.3 0.5 0.5]);

#h.text = uicontrol("style","text","string","0.1368","callback","","units","normalized","position",[0.6 0.8 0.35 0.08]);
h.btn1 = uicontrol("style","pushbutton","string","Random","callback",@HandlerControl,"units","normalized","position",[0.77 0.02 0.1 0.04]);
h.btn2 = uicontrol("style","pushbutton","string","Sair","callback",@HandlerControl,"units","normalized","position",[0.88 0.02 0.1 0.04]);
#
function HandlerControl(obj,init = false)
    h = guidata(obj)
    switch gcbo
        case h.btn1
            set(h.text,"string",num2str(rand));
        case h.btn2
            close(h.f)
        case h.select_L1
            set(h.select_L2,"value",0);
        case h.select_L2
            set(h.select_L1,"value",0);
    end
end
set(gcf,"color",get(0,"defaultuicontrolbackgroundcolor"));
guidata(h.f,h);
HandlerControl(gcf,true);

