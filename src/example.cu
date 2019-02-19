#include "pangolin/pangolin.hpp"

int main(void) {
    LOG(info, "Pangolin v{}.{}.{}", PANGOLIN_VERSION_MAJOR, PANGOLIN_VERSION_MINOR, PANGOLIN_VERSION_PATCH);

    // edges that make up a triangle
    EdgeList triangleEdges({
        Edge(1,2),
        Edge(1,3),
        Edge(2,3)

    });

    // Make a GPU vector
    pangolin::Vector<uint32_t> v;
    v.push_back(0);
    LOG(info, "Vector[0]={}",v[0]);

    // Create a triangle counter on GPU0
    Config c;
    c.gpus_ = {0};
    NvGraphTriangleCounter tc(c);
    LOG(info, "Created NvGraphTriangleCounter");

    return 0;
}