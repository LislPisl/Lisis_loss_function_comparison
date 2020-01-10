using Plots, JLD

labels = [ "No noise", "Low noise", "Medium noise", "High noise"]
labels = [ "", "", "", ""]
foldername = "col"
foldername1 = "col_low_noise"
foldername2 = "col_medium_noise"
foldername3 = "col_high_noise"

l2s = JLD.load(string("paper/vdP/",foldername,"/savel2s.jld"))["times"]
losses = JLD.load(string("paper/vdP/",foldername,"/savelosses.jld"))["losses"]
times = JLD.load(string("paper/vdP/",foldername,"/savetimes.jld"))["times"]

l2s1 = JLD.load(string("paper/vdP/",foldername1,"/savel2s.jld"))["l2s"]
losses1 = JLD.load(string("paper/vdP/",foldername1,"/savelosses.jld"))["losses"]
times1 = JLD.load(string("paper/vdP/",foldername1,"/savetimes.jld"))["times"]

l2s2 = JLD.load(string("paper/vdP/",foldername2,"/savel2s.jld"))["l2s"]
losses2 = JLD.load(string("paper/vdP/",foldername2,"/savelosses.jld"))["losses"]
times2 = JLD.load(string("paper/vdP/",foldername2,"/savetimes.jld"))["times"]

l2s3 = JLD.load(string("paper/vdP/", foldername3, "/savel2s.jld"))["times"]
losses3 = JLD.load(string("paper/vdP/",  foldername3, "/savelosses.jld"))["losses"]
times3 = JLD.load(string("paper/vdP/", foldername3, "/savetimes.jld"))["times"]

n = length(l2s)
step_size = n/5
selection = range(1,step = 50, stop =n)
selection_snips = Array(range(500,step = step_size, stop =n))
#pl_1_x=range(1,stop=length(sa_l2.losses))[selection]
#pl_1_y=log.(sa_l2.losses)[selection]
pl_2_x = range(1,stop=length(losses))[selection]
pl_2_y = log.(losses)[selection]

pl_2_x1 = range(1,stop=length(losses1))[selection]
pl_2_y1 = log.(losses1)[selection]

pl_2_x2 = range(1,stop=length(losses2))[selection]
pl_2_y2 = log.(losses2)[selection]

pl_2_x3 = range(1,stop=length(losses3))[selection]
pl_2_y3 = log.(losses3)[selection]

alphas = [1.,0.6,0.4,0.2]
alphas = [1.,1.,1.,1.,1.]


        #map(x -> 1/x, pl_2_y3)
#plot(pl_1_x,pl_1_y, color = pred_l2_c, margin=5Plots.mm, width =2, label =labels[1],  grid = "off")
#scatter!([pl_1_x[1],pl_1_x[end]],[pl_1_y[1],pl_1_y[end]], color = pred_l2_c, margin=5Plots.mm, width  =2, label ="",  grid = "off")
a =plot(pl_2_x3, pl_2_y3, width = 2, color = pred_col_c, alpha = alphas[4],label = labels[4],
                xlab = "Training epoch", ylab = "Log(Loss)", legend = :bottomleft, grid = "off")
plot!(pl_2_x2, pl_2_y2, width = 2, color = pred_col_c,alpha = alphas[3], label = labels[3],  grid = "off")
plot!(pl_2_x1, pl_2_y1, width = 2, color = pred_col_c, alpha = alphas[2], label = labels[2], grid = "off")
plot!(pl_2_x, pl_2_y, width = 2, color = pred_col_c, alpha = alphas[1],label = labels[1])

scatter!([ pl_2_x[end]], [pl_2_y[end]], color = pred_col_c, width  = 2, label = "")
scatter!([pl_2_x1[end]], [pl_2_y1[end]], color = pred_col_c, markershape = :utriangle, width = 2, label = "")
scatter!([pl_2_x2[end]], [pl_2_y2[end]], color = pred_col_c, width = 2, markershape = :dtriangle, label = "")
scatter!([pl_2_x3[end]], [pl_2_y3[end]], color = pred_col_c, width = 2, markershape = :diamond , label = "")
#plot!(selection, linestyle = :dash, log.(l2s[selection]),color = pred_col_c, width = 2, label = labels[3], grid = "off")
#vline!(selection_snips, linewidth = 2,color = "brown", label = "")


savefig(string("paper/vdP/noise_figure_selected_sub_plots/loss_drop_noise_levels.pdf"))




a = [1,2,3]

(a)
