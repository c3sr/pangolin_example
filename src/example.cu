// usually both headers are needed
// pangolin non-cuda components
#include "pangolin/pangolin.hpp"
// pangolin cuda components
#include "pangolin/pangolin.cuh"

int main(void) {
  LOG(info, "Pangolin v{}.{}.{}", PANGOLIN_VERSION_MAJOR,
      PANGOLIN_VERSION_MINOR, PANGOLIN_VERSION_PATCH);

  typedef pangolin::EdgeTy<uint32_t> Edge;

  // edges that make up a triangle
  std::vector<Edge> triangleEdges({Edge(1, 2), Edge(1, 3), Edge(2, 3)

  });

  // Make a GPU vector
  pangolin::Vector<uint32_t> v;
  v.push_back(0);
  LOG(info, "Vector[0]={}", v[0]);

  // Create a triangle counter on GPU0
  pangolin::LinearTC tc(0);
  LOG(info, "Created LinearTC");

  return 0;
}