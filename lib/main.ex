


defmodule Main do
    

    

    defmacro ast(path, args) do
        path_array = String.split path, "."
        {fun, modules} = List.pop_at(path_array, -1)
        fun = String.to_existing_atom(fun)
        modules = for m <- modules, do: String.to_existing_atom(m)
        {
            {
                :.,
                [], 
                [{:__aliases__, [alias: false], modules}, fun]
            }, 
            [],
            args
        }
    end


    def run do
        {:hi, :Proto, :Child}
        ast "Proto.Child.hi", []
    end
end