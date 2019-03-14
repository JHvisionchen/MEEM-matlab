%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	Implemetation of the tracker described in paper
%	"MEEM: Robust Tracking via Multiple Experts using Entropy Minimization", 
%   Jianming Zhang, Shugao Ma, Stan Sclaroff, ECCV, 2014
%	
%	Copyright (C) 2014 Jianming Zhang
%
%	This program is free software: you can redistribute it and/or modify
%	it under the terms of the GNU General Public License as published by
%	the Free Software Foundation, either version 3 of the License, or
%	(at your option) any later version.
%
%	This program is distributed in the hope that it will be useful,
%	but WITHOUT ANY WARRANTY; without even the implied warranty of
%	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%	GNU General Public License for more details.
%
%	You should have received a copy of the GNU General Public License
%	along with this program.  If not, see <http://www.gnu.org/licenses/>.
%
%	If you have problems about this software, please contact: jmzhang@bu.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% path to the folder with OTB sequences
base_path = '/media/cjh/datasets/tracking/OTB100/';
% choose name of the OTB sequence
sequence_name = choose_video(base_path);
video_path=[base_path sequence_name '/'];
filename = [video_path 'groundtruth_rect.txt'];
f = fopen(filename);
ground_truth = textscan(f, '%f,%f,%f,%f', 'ReturnOnError',false);  
ground_truth = cat(2, ground_truth{:});
fclose(f);
image_path=[base_path sequence_name '/img'];
gt=ground_truth(1,:);

res = MEEMTrack(image_path,'jpg',true,gt);