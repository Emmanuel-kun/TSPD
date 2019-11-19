#Program using Agatz et al. method to make a TSP-D using a TSP solution
#See "Optimization Approaches for the Traveling SalesmanProblem with Drone" - Niels AgatzPaul BoumanMarie Schmidt
#######################
#Constantes



#######################
include("tsp.jl")

#=
structure of a TSP-D solution :
tsp : TSP solution used to create the TSP-D
drone : nodes where the drones are assigned
z : value of the objective function for this solution
=#
mutable struct Solution
	tsp::Array{Integer}
	drone::Array{Integer}
	combined::Array{Integer}
	z::Integer
	Solution(tsp::Array{Integer},drone::Array{Integer},combined::Array{Integer},z::Integer) = new(sol,drone,combined,z)
	Solution(tsp::Array{Integer},z::Integer) = new(sol,Array{Integer}(),Array{Integer}(),z)
end

struct Constants
	drone_speed::Integer
	truck_speed::Integer
	drone_range::Integer
end


function evaluate!(sol::Solution)


end
#=
function that assign the drone to the node
=#
function greedy_partitionning!(sol::Solution,con::Constants)
	simple = sol.tsp
	util = zeros(Integer, simple.length)
	for node in util
		node = cout(node-1 % length(sol.tsp),node,con.truck_speed) + cout(node,node+1 % length(sol.tsp),con.truck_speed) - max(cout(node-1% length(sol.tsp),node,con.drone_speed)+cout(node,node+1% length(sol.tsp),con.drone_speed),cout(node-1% length(sol.tsp),node+1% length(sol.tsp),con.truck_speed))
	end

	while !isempty(simple)
		select = whereis(max(util))
		makefly!(sol select)
		if cout(select-1% length(simple),select,1) <= con.drone_range && cout(select,select+1,% length(simple),1) <= con.drone_range
				push!(sol.drone,select)
				push!(sol.combine,select+1%length(sol.tsp))
				push!(sol.combine,select-1%length(sol.tsp))
		else

		pop!(simple,select)

	end


end

#=
function that assign a drone to a node (cf the article p.18)
PRE: node != 1 && node != length(sol.tsp)
=#
function make_fly!(sol::Solution,node::Integer)

	push!(sol.drone,node)
	push!(sol.combined,node+1)
	push!(sol.combined,node-1)

	#we save the performing of the operation
	sol.z -= cout(node-1% length(sol.tsp),node,con.truck_speed) + cout(node,node+1,% length(sol.tsp)con.truck_speed) - max(cout(node-1% length(sol.tsp),node,con.drone_speed)+cout(node,node+1% length(sol.tsp),con.drone_speed),cout(node-1% length(sol.tsp),node+1% length(sol.tsp),con.truck_speed))

end

#=


=#
function push_left!()


end

#=


=#
function push_right!()

end
