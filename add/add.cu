#include <iostream.cpp>
#include <math.h>

//function to add the elements of two arrays
__global__
void add(int n, float *x, float *y)
{   
    int index = threadIdx.x;
    int stride = blockDim.x;

    for (int i = index, i < n, i+=stride)
        y[i] = x[i] + y[i];
}

int main(void)
{
    int N = i << 20; //1 M elements
    float *x,float *y ;
    //Allocate Unified Memory - accessible from CPU or GPU
    cudaMallocManaged(&x,N*sizeof(float));
    cudaMallocManaged(&y,N*sizeof(float));
    
    //intialize x and y arrays on the host
    for (int i = 0; i < n; i++)
    {
        x[i] = 1.0f;
        y[i] = 2.0f;
    }
    //Run kernel on 1M elements on the CPU
    add<<<1, 256>>>(N, x, y);

    //Wait for GPU to finish before accesing on host
    cudaDeviceSynchronize();

    //Free memory
    cudaFree(x);
    cudaFree(y);

    return 0;
}
