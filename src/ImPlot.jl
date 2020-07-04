module ImPlot

using CEnum

include("cimplot/cimplot.jl")

using .CImPlot
import .CImPlot: ImPlotFlags, ImPlotAxisFlags
import .CImPlot: ImPlotAxisFlags_Default, ImPlotFlags_Default, ImPlotAxisFlags_NULL
import .CImPlot: EndPlot
import CImGui: ImVec2

function BeginPlot(title_id::String, x_label::String, y_label::String, size::ImVec2;
                   flags::ImPlotFlags = ImPlotFlags_Default,
                   x_flags::ImPlotAxisFlags = ImPlotAxisFlags_Default,
                   y_flags::ImPlotAxisFlags = ImPlotAxisFlags_Default,
                   y2_flags::ImPlotAxisFlags = ImPlotAxisFlags_NULL,
                   y3_flags::ImPlotAxisFlags = ImPlotAxisFlags_NULL)::Bool

    CImPlot.BeginPlot(title_id, x_label, y_label, size,
                     flags, x_flags, y_flags, y2_flags, y3_flags)
end

BeginPlot() = BeginPlot("","","",ImVec2(-1,300))

include("lines.jl")
include("scatter.jl")
include("heatmap.jl")

end # module