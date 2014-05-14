function [ T ] = transform_subspace( n, r )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    %{

    entries = nchoosek(n,r);
    
    T = zeros(entries, entries);
    
    B = binary_subspace(n, r);
    
    i = 1;
    while i < (entries*n)
        T(i:i+entries-1) = B(i:i+entries-1);
        i = i+entries;
    end
    
    %T

    %}
    
    
    
    T = eye(nchoosek(n,r));
    T = T*0.5;
    
    entries = nchoosek(n,r);
    
    
    
    if(r == 3)
       T(1,2) = 1/4;
       T(1, length(T)) = 1/4;
       T(entries, entries - 1) = 1;
       T(entries, 1) = 1/4;
       
       for i = 2: (entries - 1)
           T(i, i-1) = 1/4;
           T(i, i+1) = 1/4;
       end
        
    %{
    
    elseif(r == 4)
        T(1,2) = 1;
        T(1,3) = 1;
        T(1,4) = 1;
        
        T(2,1) = 1;
        T(2,3) = 1;
        T(2,4) = 1;
        
        T(entries, entries - 1) = 1;
        T(entries, entries - 2) = 1;
        T(entries, entries - 3) = 1;
        
        T(entries-1, entries) = 1;
        T(entries-1, entries - 2) = 1;
        T(entries-1, entries - 3) = 1;
        
        dir = 1;

        for i = 3:entries-2
            T(i, i-1) = 1;
            T(i, i+1) = 1;
            if(mod(dir,2) == 0)
                T(i,i-2) = 1;
            else
                T(i,i+2) = 1;
            end
            
            dir = dir+1;
            
        end

    %}
        
    else 
        err = MException('ResultChk:OutOfRange', 'the input r value is only allowed to be 3');
        throw(err);

    end
    
   
    
    %{
    
    dims = size(T);
    
    R = randi(3, dims(1), 1);
    
    for i = 1:dims(1)
        
        j = 1;
        count = 0;
        while ( (j < dims(2)) && (count < R(i)) ) 
           
           if( T(i,j) == 1 )
                count = count + 1;
                if(count == R(i))
                    flip = rand(1);
                    success = 0;
                    
                    if(flip < 0.5)
                        for k = j +1 :dims(2)
                            if(T(i,k) == 0 && success == 0)
                                T(i,k) = 1;
                                T(i,j) = 0;
                                success = 1;
                            end
                        end
                        
                    else
                        for k = j-1:-1:1
                            if(T(i,k) == 0 && success == 0)
                                T(i,k) = 1;
                                T(i,j) = 0;
                                success = 1;
                            end
                        end
                    end
                    
                        
                    
                end
                
           end
           
           j = j + 1;
            
        end
        
    end
    
    
    %}

end

