function [  ] = write_eigen_matrix( A, file_name )
% Tao Du
% taodu@csail.mit.edu
% May 23, 2017
%
% Write a matrix to a binary file that can be read in Eigen by the
% following code:
%
% const Eigen::MatrixXd ReadMatrixFromBinaryFile(const std::string& file_name) {
%   std::ifstream fin(file_name, std::ios::in | std::ios::binary);
%   int row_num = 0, col_num = 0;
%   fin.read(reinterpret_cast<char*>(&row_num), sizeof(int));
%   fin.read(reinterpret_cast<char*>(&col_num), sizeof(int));
%   Eigen::MatrixXd A(row_num, col_num);
%   fin.read(reinterpret_cast<char*>(A.data()), row_num * col_num * sizeof(double));
%   fin.close();
%   return A;
% }

file_id = fopen(file_name, 'wb');

fwrite(file_id, size(A), 'int32');
fwrite(file_id, A, 'float64');

fclose(file_id);

end

