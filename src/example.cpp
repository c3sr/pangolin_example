#include "graph/pangolin.hpp"

int main(void) {
    LOG(info, "Pangolin v{}.{}.{}", GRAPH_VERSION_MAJOR, GRAPH_VERSION_MINOR, GRAPH_VERSION_PATCH);

    // edges that make up a triangle
    EdgeList triangleEdges({
        Edge(1,2),
        Edge(1,3),
        Edge(2,3)

    });

    Config c;
    c.gpus_ = {0};

    NvGraphTriangleCounter tc(c);
    LOG(info, "Created NvGraphTriangleCounter");

    return 0;
}