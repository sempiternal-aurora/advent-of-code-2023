import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.LongStream;

public class Main {
    public static Pattern almanacPattern = Pattern.compile("(?<seeds>seeds:( [0-9]*)*)\\v*(?<seedSoilMap>seed-to-soil map:(\\v[0-9]* [0-9]* [0-9]*)*)\\v*(?<soilFertMap>soil-to-fertilizer map:(\\v[0-9]* [0-9]* [0-9]*)*)\\v*(?<fertWaterMap>fertilizer-to-water map:(\\v[0-9]* [0-9]* [0-9]*)*)\\v*(?<waterLightMap>water-to-light map:(\\v[0-9]* [0-9]* [0-9]*)*)\\v*(?<lightTempMap>light-to-temperature map:(\\v[0-9]* [0-9]* [0-9]*)*)\\v*(?<tempHumidMap>temperature-to-humidity map:(\\v[0-9]* [0-9]* [0-9]*)*)\\v*(?<humidLocMap>humidity-to-location map:(\\v[0-9]* [0-9]* [0-9]*)*)");

    public static class MapRange {
        long origin;
        long dest;
        long length;
        MapRange(String map) {
            String[] temp = map.split(" ");
            origin = Long.parseLong(temp[1]);
            dest = Long.parseLong(temp[0]);
            length = Long.parseLong(temp[2]);
        }

        boolean canApplyMap(long l) {
            return l >= origin & l < origin + length;
        }

        long applyMap(long l) {
            assert canApplyMap(l);
            return l - origin + dest;
        }
    }

    public static void main(String[] args) {
        try {
            String input = Files.readString(Path.of("day5/input"));
            System.out.println(input);
            //ArrayList<Long> locations = getLocations(input);
            //System.out.println(locations);
            //long minLoc = locations.stream().reduce(Math::min).get();
            long minLoc = getMinLocations(input);
            System.out.println(minLoc);
        } catch (IOException e) {
            System.out.println("Cannot find input file");
        }
    }

    public static LongStream parseSeeds(String seedStr) {
        String[] rawSeeds = seedStr.split(" ");
        return Arrays.stream(rawSeeds)
                .skip(1)
                .mapToLong(Long::parseLong);
    }

    public static LongStream parseSeedRange(String seedStr) {
        String[] rawSeeds = seedStr.split(" ");
        LongStream seeds = LongStream.range(0, 0);
        for (int i = 1; i < rawSeeds.length-1; i += 2) {
            long start = Long.parseLong(rawSeeds[i]);
            long length = Long.parseLong(rawSeeds[i+1]);
            seeds = LongStream.concat(seeds, LongStream.range(start, start+length));
        }
        return seeds.parallel();
    }
    public static ArrayList<MapRange> parseMap(String mapString) {
        return Arrays.stream(mapString.split("\\v"))
                .skip(1)
                .map(MapRange::new)
                .collect(Collectors.toCollection(ArrayList::new));
    }

    public static long applyMap(ArrayList<MapRange> map, long l) {
        for (MapRange range : map) {
            if (range.canApplyMap(l)) {
                return range.applyMap(l);
            }
        }
        return l;
    }

    public static long getMinLocations(String almanac) {
        Matcher matcher = almanacPattern.matcher(almanac);
        if (matcher.matches()) {
            String seedStr = matcher.group("seeds");
            LongStream seeds = parseSeedRange(seedStr);

            ArrayList<MapRange> seedSoilMap = parseMap(matcher.group("seedSoilMap"));
            ArrayList<MapRange> soilFertMap = parseMap(matcher.group("soilFertMap"));
            ArrayList<MapRange> fertWaterMap = parseMap(matcher.group("fertWaterMap"));
            ArrayList<MapRange> waterLightMap = parseMap(matcher.group("waterLightMap"));
            ArrayList<MapRange> lightTempMap = parseMap(matcher.group("lightTempMap"));
            ArrayList<MapRange> tempHumidMap = parseMap(matcher.group("tempHumidMap"));
            ArrayList<MapRange> humidLocMap = parseMap(matcher.group("humidLocMap"));

            return seeds
                    .map(l -> applyMap(seedSoilMap, l))
                    .map(l -> applyMap(soilFertMap, l))
                    .map(l -> applyMap(fertWaterMap, l))
                    .map(l -> applyMap(waterLightMap, l))
                    .map(l -> applyMap(lightTempMap, l))
                    .map(l -> applyMap(tempHumidMap, l))
                    .map(l -> applyMap(humidLocMap, l))
                    .reduce(Math::min)
                    .getAsLong();
        } else {
            return -1;
        }
    }

    public static ArrayList<Long> getLocations(String almanac) {
        Matcher matcher = almanacPattern.matcher(almanac);
        if (matcher.matches()) {
            String seedStr = matcher.group("seeds");
            LongStream seeds = parseSeeds(seedStr);

            ArrayList<MapRange> seedSoilMap = parseMap(matcher.group("seedSoilMap"));
            ArrayList<MapRange> soilFertMap = parseMap(matcher.group("soilFertMap"));
            ArrayList<MapRange> fertWaterMap = parseMap(matcher.group("fertWaterMap"));
            ArrayList<MapRange> waterLightMap = parseMap(matcher.group("waterLightMap"));
            ArrayList<MapRange> lightTempMap = parseMap(matcher.group("lightTempMap"));
            ArrayList<MapRange> tempHumidMap = parseMap(matcher.group("tempHumidMap"));
            ArrayList<MapRange> humidLocMap = parseMap(matcher.group("humidLocMap"));

            return seeds
                    .map(l -> applyMap(seedSoilMap, l))
                    .map(l -> applyMap(soilFertMap, l))
                    .map(l -> applyMap(fertWaterMap, l))
                    .map(l -> applyMap(waterLightMap, l))
                    .map(l -> applyMap(lightTempMap, l))
                    .map(l -> applyMap(tempHumidMap, l))
                    .map(l -> applyMap(humidLocMap, l))
                    .boxed()
                    .collect(Collectors.toCollection(ArrayList::new));
        } else {
            return null;
        }
    }
}