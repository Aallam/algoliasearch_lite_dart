import 'package:algolia_lite/algolia_lite.dart';
import 'package:test/test.dart';

void main() {
  test('Search', () async {
    final client = SearchClient(
      applicationID: 'latency',
      apiKey: 'afc3dd66dd1293e2e2736a5a51b05c0a',
    );
    final req = SearchRequest.create(
      indexName: 'instant_search',
      params: {'query': 'a'},
    );
    final res = await client.search(req);
    expect(res.isNotEmpty, true);
  });

  test('MultiSearch', () async {
    final client = SearchClient(
      applicationID: 'latency',
      apiKey: 'afc3dd66dd1293e2e2736a5a51b05c0a',
    );
    final req = MultiSearchRequest(requests: [
      SearchRequest.create(
        indexName: 'instant_search',
        params: {'query': 'a'},
      )
    ]);
    final res = await client.multiSearch(req);
    expect(res.isNotEmpty, true);
  });

  test('FacetSearch', () async {
    final client = SearchClient(
      applicationID: 'latency',
      apiKey: 'afc3dd66dd1293e2e2736a5a51b05c0a',
    );
    final req = FacetSearchRequest(
      indexName: 'instant_search',
      facetName: 'categories',
      facetQuery: 'a',
    );
    final res = await client.facetsSearch(req);
    expect(res.isNotEmpty, true);
  });

  test('Browse All', () async {
    final client = SearchClient(
      applicationID: 'latency',
      apiKey: 'afc3dd66dd1293e2e2736a5a51b05c0a',
    );
    final req = SearchRequest('instant_search');
    final stream = client.browse(req);
    expect(stream, emitsInOrder([mayEmitMultiple(anything), emitsDone]));
  });

  test('Objects', () async {
    final client = SearchClient(
      applicationID: 'latency',
      apiKey: 'afc3dd66dd1293e2e2736a5a51b05c0a',
    );
    final req = ObjectsRequest(requests: [
      ObjectRequest(indexName: 'instant_search', objectID: '6443034'),
      ObjectRequest(indexName: 'instant_search', objectID: '4863102'),
    ]);
    final res = await client.objects(req);
    print(res);
    expect(res.isNotEmpty, true);
  });
}
