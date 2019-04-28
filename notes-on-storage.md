## Notes on Solidity (Ethereum) storage: 

__storage__:\
    - is the *persistent memory* that every account has\
    - is a *key-value store* where keys and values are both 32 bytes\


__memory__:\
    - is a byte-*array*, which hold the data in it until the execution of the function\
    - memory *starts with zero-size* and *can be expanded* in 32-byte chunks simply by accessing or storing memory at indices greater than its current size\
    - To __save gas__, it is __recommended__ to *shrink memory size* whenever possible\


__stack__:\
    - is used to *hold small local variables*\
    - costs the same amount as memory, but *can only hold* a *limited amount of values*\

### Comparing Gas Consumption in Storage and Memory:

__storage gas consumption__:\
    - storage gas...\
                    - Costs 20,000 gas when a *value* is *set to non-zero from zero*\
                    - Costs 5,000 gas when *writing to existing storage* or *setting* a *value to zero*\
                    - 5,000 gas is *refunded* when a *non-zero value* is *set to zero*\
    - Gas savings from packing storage is still possible, such as __fitting 2 uint128 values within__ a *single key*, instead of using 2 keys
\
__memory gas consumption__:\
    - gas cost of memory expansion is defined in Yellow Paper (http://yellowpaper.io/) as follows:\
      \
      C_mem(a) === G_memory * a + (| (a**2) / (512) |)\
      \
      where:       G_memory = 3, a = number of 256-bit chunk words allocated\
    - For a = __512 chunks__, Gas consumption will be (3 * 512 + (512 * 512) / 512) = __2560 units__\
    *Note:* *Cost of memory usage is not very significant as compared to storage. It's a good practice to always use memory to perform intermediate calculations and store results in storage.* \

## For each type of variable, there exists a default storage location:

__state variables__ are *always* in *storage*\
__function arguments__ are *always* in *memory*\
__local variables of struct, array, or mapping type reference__ are *stored* in *storage by default* \
__local variables of a value type__ (uint, int, etc) are *stored* in *the stack*\
