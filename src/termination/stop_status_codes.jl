struct IterationLimit           <: AbstractTermination end
struct TimeLimit                <: AbstractTermination end
struct EvaluationsLimit         <: AbstractTermination end
struct AccuracyLimit            <: AbstractTermination end
struct OtherLimit               <: AbstractTermination end
struct ObjectiveVarianceLimit   <: AbstractTermination end
struct ObjectiveDifferenceLimit <: AbstractTermination end
struct UnknownStopReason        <: AbstractTermination end


const ITERATION_LIMIT           = IterationLimit()
const TIME_LIMIT                = TimeLimit()
const EVALUATIONS_LIMIT         = EvaluationsLimit()
const ACCURACY_LIMIT            = AccuracyLimit()
const OTHER_LIMIT               = OtherLimit()
const UNKNOWN_STOP_REASON       = UnknownStopReason()
const OBJECTIVE_VARIANCE_LIMIT  = ObjectiveVarianceLimit()
const OBJECTIVE_DIFFERENCE_LIMIT= ObjectiveDifferenceLimit()

"""
    termination_status_message(status)

Return a string of the message related to the `status`.

See [`TerminationStatusCode`](@ref)

### Example:

```julia-repl
julia> termination_status_message(Metaheuristics.ITERATION_LIMIT)
"Maximum number of iterations exceeded."

julia> termination_status_message(optimize(f, bounds))
"Maximum number of iterations exceeded."

julia> termination_status_message(ECA())
"Unknown stop reason."
```
"""
function termination_status_message(status_code::TerminationStatusCode)
    codes = Dict(
                 ITERATION_LIMIT => "Maximum number of iterations exceeded.",
                 TIME_LIMIT => "Maximum time exceeded.",
                 EVALUATIONS_LIMIT => "Maximum objective function calls exceeded.",
                 ACCURACY_LIMIT => "The desired accuracy was obtained.",
                 OBJECTIVE_VARIANCE_LIMIT => "Small variance of the objective function.",
                 OBJECTIVE_DIFFERENCE_LIMIT =>"Small difference of objective function values.",
                 OTHER_LIMIT => "Other stopping criteria.",
                 UNKNOWN_STOP_REASON => "Unknown stop reason."
    )
    try
        return codes[status_code]
    catch
        throw("Illegal value $status_code")
    end
end

