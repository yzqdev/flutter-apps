import 'package:dartz/dartz.dart';
import 'package:feature_tv/domain/entities/tv.dart';
import 'package:feature_tv/domain/repositories/tv_repository.dart';
import 'package:feature_tv/domain/usecases/get_popular_tv_shows.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTVRepository extends Mock implements TVRepository {}

void main() {
  late GetPopularTVShows usecase;
  late MockTVRepository mockTVRepository;

  setUp(() {
    mockTVRepository = MockTVRepository();
    usecase = GetPopularTVShows(repository: mockTVRepository);
  });

  final tTVShows = <TV>[];
  group('GetPopularTVShows Tests', () {
    test(
        'should get list of popular tv shows the repository when execute function is called',
        () async {
      // arrange
      when(() => mockTVRepository.getPopularTVShows())
          .thenAnswer((_) async => Right(tTVShows));
      // act
      final result = await usecase.execute();
      // assert
      expect(result, Right(tTVShows));
    });
  });
}
