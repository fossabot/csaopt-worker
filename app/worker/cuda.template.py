from numba import cuda

@cuda.jit(device=True)
$initialize

@cuda.jit(device=True)
$cool

@cuda.jit(device=True)
$generate_next

@cuda.jit(device=True)
$evaluate

@cuda.jit(device=True)
$acceptance_func

@cuda.jit
def simulated_annealing(max_steps, initial_temp, states):
    thread_id = cuda.grid(1)
    step = 0
    # TODO: generate random vector
    state = initialize(random_values)
    energy = evaluate(state)
    temperature = initial_temp
    while(step < max_steps):
        temperature = cool(temperature)
        new_state = generate_next(state, random_values)
        new_energy = evaluate(new_state)
        if acceptance_func():
            state = new_state
            energy = new_energy
        step += 1

    states[thread_id] = (state, energy)