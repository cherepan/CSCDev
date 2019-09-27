echo "nSeg = 0" 
grep "nSegments: 0" output.txt  | wc -l

echo "nSeg = 1" 
grep "nSegments: 1" output.txt  | wc -l

echo "nSeg = 2" 
grep "nSegments: 2" output.txt  | wc -l

echo ""

echo "nWireSeg = 0" 
grep "nWireSegments: 0" output.txt  | wc -l

echo "nWireSeg = 1" 
grep "nWireSegments: 1" output.txt  | wc -l

echo "nWireSeg = 2" 
grep "nWireSegments: 2" output.txt  | wc -l

echo "nWireSeg = 3" 
grep "nWireSegments: 3" output.txt  | wc -l

echo "nWireSeg = 4" 
grep "nWireSegments: 4" output.txt  | wc -l

echo "nWireSeg = 5" 
grep "nWireSegments: 5" output.txt  | wc -l

echo "nWireSeg = 6" 
grep "nWireSegments: 6" output.txt  | wc -l


echo ""

echo "nStripSeg = 0" 
grep "nStripSegments: 0" output.txt  | wc -l

echo "nStripSeg = 1" 
grep "nStripSegments: 1" output.txt  | wc -l

echo "nStripSeg = 2" 
grep "nStripSegments: 2" output.txt  | wc -l

echo "nStripSeg = 3" 
grep "nStripSegments: 3" output.txt  | wc -l

echo "nStripSeg = 4" 
grep "nStripSegments: 4" output.txt  | wc -l

echo "nStripSeg = 5" 
grep "nStripSegments: 5" output.txt  | wc -l

echo "nStripSeg = 6" 
grep "nStripSegments: 6" output.txt  | wc -l

echo ""

#grep "rechits = 6" output.txt | wc -l; grep "rechits = 5" output.txt | wc -l; grep "rechits = 4" output.txt | wc -l;grep "rechits = 3" output.txt | wc -l;

echo "wire add back"
grep "Wire add back" output.txt | wc -l
echo "bring back ALCT"
grep "add back recover ALCT" output.txt | wc -l

echo "strip add back"
grep "Strip add back" output.txt | wc -l
echo "5 hits rank1 add back"
grep "5 hits rank1" output.txt | wc -l
echo "5 hits all ranks add back"
grep "5 hits all ranks" output.txt | wc -l
echo "bring back CLCT"
grep "add back recover CLCT" output.txt | wc -l

grep "Begin" output.txt | tail
