## Notes on Solidity (Ethereum) storage:

_storage_:
    - is the *persistent memory* that every account has
    - is a *key-value store* where keys and values are both 32 bytes


_memory_:
    - is a byte-*array*, which hold the data in it until the execution of 
      the function
    - memory *starts with zero-size* and *can be expanded* in 32-byte chunks 
      simply by accessing or storing memory at indices greater than its 
      current size
    - To _save gas_, it is _recommended_ to *shrink memory size* whenever
      possible


_stack_:
    - is used to *hold small local variables*
    - costs the same amount as memory, but *can only hold* a *limited amount of values*

### Comparing Gas Consumption in Storage and Memory:

_storage gas consumption_:
    - storage gas...
                    - Costs 20,000 gas when a *value* is *set to non-zero from zero*
                    - Costs 5,000 gas when *writing to existing storage* or *setting* a *value to zero*
                    - 5,000 gas is *refunded* when a *non-zero value* is *set to zero*
    - Gas savings from packing storage is still possible, such as *fitting 2 uint128 values within* a *single key*, instead of using 2 keys

_memory gas consumption_:
    - gas cost of memory expansion is defined in Yellow Paper (http://yellowpaper.io/) as follows:
      C_mem(a) === G_memory * a + (| (a**2) / (512) |)
      where:       G_memory = 3,
                   a = number of 256-bit chunk words allocated
    - For a = _512 chunks_, Gas consumption will be (3 * 512 + (512 * 512) / 512) = _2560 units_
    *Note:* *Cost of memory usage is not very significant as compared to storage. It's a good practice to always use memory to perform intermediate calculations and store results in storage.* 

## For each type of variable, there exists a default storage location:

_state variables_ are *always* in *storage*
_function arguments_ are *always* in *memory*
_local variables of struct, array, or mapping type reference_ are *stored* in *storage by default* 
_local variables of a value type_ (uint, int, etc) are *stored* in *the stack*
